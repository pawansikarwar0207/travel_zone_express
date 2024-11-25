class SettingsController < ApplicationController
  def edit
    @module = params[:module]  # Access the :module parameter
    if @module.nil?
      redirect_to dashboard_path, alert: "Module not found"
      return
    end

    @module_display_name = @module.capitalize  # Capitalize the module name
    @setting = Setting.find_or_initialize_by(name: "#{@module}_disabled")
  end

  def update
    @module = params[:id]
    @setting = Setting.find_or_initialize_by(name: "#{@module}_disabled")
    @setting.value = params[:disable] == 'true' ? 'true' : 'false'

    if @setting.save
      redirect_to dashboard_path, notice: "#{@module.capitalize} settings updated."
    else
      render :edit, alert: "Failed to update #{@module.capitalize} settings."
    end
  end
end
