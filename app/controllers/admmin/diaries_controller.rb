class Admmin::DiariesController < ApplicationController
  
  def index
    @diaries = Diary.visibility
  end

  def show
    @diary = Diary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diary }
    end
  end

  # GET /Diarys/new
  # GET /Diarys/new.json
  def new
    @diary = Diary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diary }
    end
  end

  # GET /Diarys/1/edit
  def edit
    @diary = Diary.find(params[:id])
  end

  # POST /Diarys
  # POST /Diarys.json
  def create
    @diary = Diary.new(params[:diary])

    respond_to do |format|
      if @diary.save
        format.html { redirect_to :action=>'index', notice: 'Diary was successfully created.' }
        format.json { render json: @diary, status: :created, location: @diary }
      else
        format.html { render action: "new" }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Diarys/1
  # PUT /Diarys/1.json
  def update
    @diary = Diary.find(params[:id])

    respond_to do |format|
      if @diary.update_attributes(params[:diary])
        format.html { redirect_to :action=>'index', notice: 'Diary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Diarys/1
  # DELETE /Diarys/1.json
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy

    respond_to do |format|
      format.html { redirect_to :action=>'index' }
      format.json { head :no_content }
    end
  end

end