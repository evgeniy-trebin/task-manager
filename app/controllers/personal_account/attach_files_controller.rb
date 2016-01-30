module PersonalAccount
  class AttachFilesController < BaseController
    before_action :set_task
    before_action :set_attach_file, only: [:show, :edit, :update, :destroy, :download]

    # GET /attach_files/1
    # GET /attach_files/1.json
    def show
    end

    # GET /attach_files/new
    def new
      @attach_file = AttachFile.new
    end

    # GET /attach_files/1/edit
    def edit
    end

    # POST /attach_files
    # POST /attach_files.json
    def create
      @attach_file = AttachFile.new(attach_file_params)
      @attach_file.task = @task
      respond_to do |format|
        if @attach_file.save
          format.html { redirect_to personal_account_task_path(@task), notice: t('controller_messages.crud.create.success', model: 'AttachFile') }
          format.json { render :show, status: :created, location: personal_account_task_path(@task) }
        else
          format.html { render :new }
          format.json { render json: @attach_file.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /attach_files/1
    # PATCH/PUT /attach_files/1.json
    def update
      respond_to do |format|
        if @attach_file.update(attach_file_params)
          format.html { redirect_to [:personal_account, @task, @attach_file], notice: t('controller_messages.crud.update.success', model: 'AttachFile') }
          format.json { render :show, status: :ok, location: personal_account_task_path(@task) }
        else
          format.html { render :edit }
          format.json { render json: @attach_file.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /attach_files/1
    # DELETE /attach_files/1.json
    def destroy
      @attach_file.destroy
      respond_to do |format|
        format.html { redirect_to personal_account_task_path(@task), notice: t('controller_messages.crud.destroy.success', model: 'AttachFile') }
        format.json { head :no_content }
      end
    end

    def download
      send_file(Rails.root.join('public', @attach_file.file.path))
    end

    private

    def set_task
      @task = current_user.tasks.find(params[:task_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_attach_file
      @attach_file = @task.attach_files.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attach_file_params
      params.require(:attach_file).permit(:file, :name)
    end
  end
end