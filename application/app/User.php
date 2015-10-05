<?php namespace HelloVideo;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;
use Laravel\Cashier\Billable;
use Laravel\Cashier\Contracts\Billable as BillableContract;


class User extends Model implements AuthenticatableContract, CanResetPasswordContract, BillableContract {
	use Authenticatable, CanResetPassword, Billable;
	/**
	 * The database table used by the model.
	 *
	 * @var string
	 */
	protected $table = 'users';
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['username', 'active', 'email', 'avatar', 'password', 'role', 'status', 'disabled'];
	/**
	 * The attributes excluded from the model's JSON form.
	 *
	 * @var array
	 */
	protected $hidden = ['password', 'remember_token'];

	protected $dates = ['trial_ends_at', 'subscription_ends_at'];

	public static $rules = array('username' => 'required|unique:users|min:3',
						        'email' => 'required|email|unique:users',
						        'password' => 'required|confirmed|min:3'
						    );

	public static $update_rules = array('username' => 'unique:users|min:3',
						        'email' => 'email|unique:users'
						    );
}