module PersonalAccount
  class TasksController < BaseController

    include ApplicationHelper

    before_action :set_task, only: [:show, :edit, :update, :destroy, :change_state]

    # GET /tasks
    # GET /tasks.json
    def index
      @tasks = current_user.tasks.sorted
      respond_to do |format|
        format.html
        format.json { render layout: false }
      end
    end

    # GET /tasks/1
    # GET /tasks/1.json
    def show
      respond_to do |format|
        format.html
        format.json { render layout: false }
      end
    end

    # GET /tasks/new
    def new
      @task = Task.new
      respond_to do |format|
        format.html
        format.json { head :no_content }
      end
    end

    # GET /tasks/1/edit
    def edit
    end

    # POST /tasks
    # POST /tasks.json
    def create
      @task = Task.new(task_params)
      @task.user = current_user
      respond_to do |format|
        if @task.save
          format.html { redirect_to [:personal_account, @task], notice: t('controller_messages.crud.create.success', model: 'Task') }
          format.json { render :show, status: :created, location: [:personal_account, @task] }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /tasks/1
    # PATCH/PUT /tasks/1.json
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to [:personal_account, @task], notice: t('controller_messages.crud.update.success', model: 'Task') }
          format.json { render :show, status: :ok, location: [:personal_account, @task] }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tasks/1
    # DELETE /tasks/1.json
    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to personal_account_tasks_path, notice: t('controller_messages.crud.destroy.success', model: 'Task') }
        format.json { head :no_content }
      end
    end

    def change_state
      if @task.next_state
        render json: {result: :success, state: @task.state, html: render_to_string(inline: change_task_state_link(@task))}
      else
        render json: {result: :fail, message: t('controller_messages.tasks.change_state_error'), state: @task.state}
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description)
    end
  end

end
