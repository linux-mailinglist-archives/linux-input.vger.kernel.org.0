Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E54641847DE
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 14:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgCMNTk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 09:19:40 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56273 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgCMNTk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 09:19:40 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 071C1C000F;
        Fri, 13 Mar 2020 13:19:36 +0000 (UTC)
Message-ID: <fc21cb83fb54e0f9d8446799506f01bac49fd128.camel@hadess.net>
Subject: Re: [PATCH v2 1/2] Input: goodix - Add support for more then one
 touch-key
From:   Bastien Nocera <hadess@hadess.net>
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Date:   Fri, 13 Mar 2020 14:19:35 +0100
In-Reply-To: <20200312145009.27449-1-dmastykin@astralinux.ru>
References: <20200312145009.27449-1-dmastykin@astralinux.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.92 (3.35.92-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2020-03-12 at 17:50 +0300, Dmitry Mastykin wrote:
> Some devices with a goodix touchscreen have more then 1 capacitive
> touch-key. This commit replaces the current support for a single
> touch-key, which ignored the reported key-code. With support for
> up to 7 touch-keys, based upon checking the key-code which is
> post-fixed to any reported touch-data.
> 
> KEY_LEFTMETA is assigned to the first touch-key (it will still be
> the default keycode for devices with a single touch-key).
> KEY_F1, KEY_F2... are assigned as default keycode for the other
> touch-keys.
> 
> This commit also add supports for keycode remapping, so that
> systemd-udev's hwdb can be used to remap the codes to send
> keycodes to match the icons on the buttons for devices with more
> then 1 touch-key.
> 
> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>
> ---
> Changes in v2:
> - Improve commit message
> ---
>  drivers/input/touchscreen/goodix.c | 54 ++++++++++++++++++++++++--
> ----
>  1 file changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index adb9b92..daf1781 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -38,6 +38,7 @@
>  #define GOODIX_CONTACT_SIZE		8
>  #define GOODIX_MAX_CONTACT_SIZE		9
>  #define GOODIX_MAX_CONTACTS		10
> +#define GOODIX_MAX_KEYS			7
>  
>  #define GOODIX_CONFIG_MIN_LENGTH	186
>  #define GOODIX_CONFIG_911_LENGTH	186
> @@ -55,6 +56,7 @@
>  #define GOODIX_REG_ID			0x8140
>  
>  #define GOODIX_BUFFER_STATUS_READY	BIT(7)
> +#define GOODIX_HAVE_KEY			BIT(4)
>  #define GOODIX_BUFFER_STATUS_TIMEOUT	20
>  
>  #define RESOLUTION_LOC		1
> @@ -100,6 +102,7 @@ struct goodix_ts_data {
>  	enum goodix_irq_pin_access_method irq_pin_access_method;
>  	unsigned int contact_size;
>  	u8 config[GOODIX_CONFIG_MAX_LENGTH];
> +	unsigned short keymap[GOODIX_MAX_KEYS];
>  };
>  
>  static int goodix_check_cfg_8(struct goodix_ts_data *ts,
> @@ -285,8 +288,14 @@ static int goodix_ts_read_input_report(struct
> goodix_ts_data *ts, u8 *data)
>  	 */
>  	max_timeout = jiffies +
> msecs_to_jiffies(GOODIX_BUFFER_STATUS_TIMEOUT);
>  	do {
> +		/*
> +		 * We are going to read ts->contact_size * max(1,
> touch_num) + 2
> +		 * bytes, where + 2 consists of reading 1 extra byte
> for the
> +		 * header + 1 extra byte for the footer which contains
> the
> +		 * touch-key code.

Can't say that I like the magic "2" used here and in a number of other
places in this patch. Is it always the same 2? If so, could we use a
constant instead? (GOODIX_TOUCH_KEYS_HEADER_FOOTER_SIZE?)

Looks good otherwise.

> +		 */
>  		error = goodix_i2c_read(ts->client,
> GOODIX_READ_COOR_ADDR,
> -					data, ts->contact_size + 1);
> +					data, ts->contact_size + 2);
>  		if (error) {
>  			dev_err(&ts->client->dev, "I2C transfer error:
> %d\n",
>  					error);
> @@ -299,10 +308,10 @@ static int goodix_ts_read_input_report(struct
> goodix_ts_data *ts, u8 *data)
>  				return -EPROTO;
>  
>  			if (touch_num > 1) {
> -				data += 1 + ts->contact_size;
> +				data += 2 + ts->contact_size;
>  				error = goodix_i2c_read(ts->client,
>  						GOODIX_READ_COOR_ADDR +
> -							1 + ts-
> >contact_size,
> +							2 + ts-
> >contact_size,
>  						data,
>  						ts->contact_size *
>  							(touch_num -
> 1));
> @@ -353,6 +362,23 @@ static void goodix_ts_report_touch_9b(struct
> goodix_ts_data *ts, u8 *coor_data)
>  	input_report_abs(ts->input_dev, ABS_MT_WIDTH_MAJOR, input_w);
>  }
>  
> +static void goodix_ts_report_key(struct goodix_ts_data *ts, u8
> *data)
> +{
> +	int touch_num;
> +	u8 key_value;
> +	int i;
> +
> +	if (data[0] & GOODIX_HAVE_KEY) {
> +		touch_num = data[0] & 0x0f;
> +		key_value = data[1 + ts->contact_size * touch_num];
> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> +			if (key_value & (1 << i))
> +				input_report_key(ts->input_dev, ts-
> >keymap[i], 1);
> +	} else
> +		for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> +			input_report_key(ts->input_dev, ts->keymap[i],
> 0);
> +}
> +
>  /**
>   * goodix_process_events - Process incoming events
>   *
> @@ -363,7 +389,7 @@ static void goodix_ts_report_touch_9b(struct
> goodix_ts_data *ts, u8 *coor_data)
>   */
>  static void goodix_process_events(struct goodix_ts_data *ts)
>  {
> -	u8  point_data[1 + GOODIX_MAX_CONTACT_SIZE *
> GOODIX_MAX_CONTACTS];
> +	u8  point_data[2 + GOODIX_MAX_CONTACT_SIZE *
> GOODIX_MAX_CONTACTS];
>  	int touch_num;
>  	int i;
>  
> @@ -371,11 +397,7 @@ static void goodix_process_events(struct
> goodix_ts_data *ts)
>  	if (touch_num < 0)
>  		return;
>  
> -	/*
> -	 * Bit 4 of the first byte reports the status of the capacitive
> -	 * Windows/Home button.
> -	 */
> -	input_report_key(ts->input_dev, KEY_LEFTMETA, point_data[0] &
> BIT(4));
> +	goodix_ts_report_key(ts, point_data);
>  
>  	for (i = 0; i < touch_num; i++)
>  		if (ts->contact_size == 9)
> @@ -961,6 +983,7 @@ static int goodix_i2c_test(struct i2c_client
> *client)
>  static int goodix_configure_dev(struct goodix_ts_data *ts)
>  {
>  	int error;
> +	int i;
>  
>  	ts->int_trigger_type = GOODIX_INT_TRIGGER;
>  	ts->max_touch_num = GOODIX_MAX_CONTACTS;
> @@ -978,8 +1001,19 @@ static int goodix_configure_dev(struct
> goodix_ts_data *ts)
>  	ts->input_dev->id.product = ts->id;
>  	ts->input_dev->id.version = ts->version;
>  
> +	ts->input_dev->keycode = ts->keymap;
> +	ts->input_dev->keycodesize = sizeof(ts->keymap[0]);
> +	ts->input_dev->keycodemax = GOODIX_MAX_KEYS;
> +
>  	/* Capacitive Windows/Home button on some devices */
> -	input_set_capability(ts->input_dev, EV_KEY, KEY_LEFTMETA);
> +	for (i = 0; i < GOODIX_MAX_KEYS; ++i) {
> +		if (i == 0)
> +			ts->keymap[i] = KEY_LEFTMETA;
> +		else
> +			ts->keymap[i] = KEY_F1 + (i - 1);
> +
> +		input_set_capability(ts->input_dev, EV_KEY, ts-
> >keymap[i]);
> +	}
>  
>  	input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_X);
>  	input_set_capability(ts->input_dev, EV_ABS, ABS_MT_POSITION_Y);

