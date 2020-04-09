Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 055FE1A3C55
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 00:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDIWVP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 18:21:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:57144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbgDIWVP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 Apr 2020 18:21:15 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A5EE2083E;
        Thu,  9 Apr 2020 22:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586470875;
        bh=Jppb1obNkX1IeI3tjxBViiA7iN4ydeaVqv01zbXI0WA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=AybwdDI/rjq6JeEpISwPayKV7Ui/fiWUlgsjQjGJhLkpTw6uW22lZmrsIb+Ll7JPL
         J2aiBEfqqxY2/v5Wrx9qqGSh/L0SjYf6GLa2GHKl5nFqCxdIM9QAfCyM/ERpCyr9dy
         2m4zxvvLv7wQ7MGKO/gw4LorqgirvpaXS1Hccjso=
Date:   Fri, 10 Apr 2020 00:21:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Artem Borisov <dedsa2002@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masaki Ota <masaki.ota@jp.alps.com>
Subject: Re: [PATCH 2/2] HID: alps: Refactor axis resolution logic
In-Reply-To: <20200405235517.18203-2-dedsa2002@gmail.com>
Message-ID: <nycvar.YFH.7.76.2004100019450.19713@cbobk.fhfr.pm>
References: <20200405235517.18203-1-dedsa2002@gmail.com> <20200405235517.18203-2-dedsa2002@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 6 Apr 2020, Artem Borisov wrote:

> AUI1657 doesn't follow the same logic for resolution calculation, since
> the resulting values are incorrect. Instead, it reports the actual
> resolution values in place of the pitch ones.
> While we're at it, also refactor the whole resolution logic to make it more
> generic and sensible for multiple device support.

Let's add Masaki Ota to ack this change if possible.

Would it be possible to be a little bit more verbose in the changelog, 
explaining *how* (or why) is the patch making the logic more generic and 
sensible?

Thanks!

> Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
> ---
>  drivers/hid/hid-alps.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index c2a2bd528890..494c08cca645 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -83,8 +83,8 @@ enum dev_num {
>   * @max_fingers: total number of fingers
>   * @has_sp: boolean of sp existense
>   * @sp_btn_info: button information
> - * @x_active_len_mm: active area length of X (mm)
> - * @y_active_len_mm: active area length of Y (mm)
> + * @x_res: resolution of X
> + * @y_res: resolution of Y
>   * @x_max: maximum x coordinate value
>   * @y_max: maximum y coordinate value
>   * @x_min: minimum x coordinate value
> @@ -100,9 +100,10 @@ struct alps_dev {
>  	enum dev_num dev_type;
>  	u8  max_fingers;
>  	u8  has_sp;
> +	u8  no_pitch;
>  	u8	sp_btn_info;
> -	u32	x_active_len_mm;
> -	u32	y_active_len_mm;
> +	u32	x_res;
> +	u32	y_res;
>  	u32	x_max;
>  	u32	y_max;
>  	u32	x_min;
> @@ -550,10 +551,6 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
>  		dev_err(&hdev->dev, "failed U1_RESO_DWN_ABS (%d)\n", ret);
>  		goto exit;
>  	}
> -	pri_data->x_active_len_mm =
> -		(pitch_x * (sen_line_num_x - 1)) / 10;
> -	pri_data->y_active_len_mm =
> -		(pitch_y * (sen_line_num_y - 1)) / 10;
>  
>  	pri_data->x_max =
>  		(resolution << 2) * (sen_line_num_x - 1);
> @@ -562,6 +559,18 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
>  		(resolution << 2) * (sen_line_num_y - 1);
>  	pri_data->y_min = 1;
>  
> +	if (pri_data->no_pitch) {
> +		pri_data->x_res = pitch_x;
> +		pri_data->y_res = pitch_y;
> +	} else {
> +		pri_data->x_res =
> +			(pri_data->x_max - 1) /
> +			((pitch_x * (sen_line_num_x - 1)) / 10);
> +		pri_data->y_res =
> +			(pri_data->y_max - 1) /
> +			((pitch_y * (sen_line_num_y - 1)) / 10);
> +	}
> +
>  	ret = u1_read_write_register(hdev, ADDRESS_U1_PAD_BTN,
>  			&tmp, 0, true);
>  	if (ret < 0) {
> @@ -622,7 +631,7 @@ static int T4_init(struct hid_device *hdev, struct alps_dev *pri_data)
>  	pri_data->x_min = T4_COUNT_PER_ELECTRODE;
>  	pri_data->y_max = sen_line_num_y * T4_COUNT_PER_ELECTRODE;
>  	pri_data->y_min = T4_COUNT_PER_ELECTRODE;
> -	pri_data->x_active_len_mm = pri_data->y_active_len_mm = 0;
> +	pri_data->x_res = pri_data->y_res = 0;
>  	pri_data->btn_cnt = 1;
>  
>  	ret = t4_read_write_register(hdev, PRM_SYS_CONFIG_1, &tmp, 0, true);
> @@ -675,7 +684,7 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	struct alps_dev *data = hid_get_drvdata(hdev);
>  	struct input_dev *input = hi->input, *input2;
>  	int ret;
> -	int res_x, res_y, i;
> +	int i;
>  
>  	data->input = input;
>  
> @@ -706,12 +715,9 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  	input_set_abs_params(input, ABS_MT_POSITION_Y,
>  						data->y_min, data->y_max, 0, 0);
>  
> -	if (data->x_active_len_mm && data->y_active_len_mm) {
> -		res_x = (data->x_max - 1) / data->x_active_len_mm;
> -		res_y = (data->y_max - 1) / data->y_active_len_mm;
> -
> -		input_abs_set_res(input, ABS_MT_POSITION_X, res_x);
> -		input_abs_set_res(input, ABS_MT_POSITION_Y, res_y);
> +	if (data->x_res && data->y_res) {
> +		input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res);
> +		input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
>  	}
>  
>  	input_set_abs_params(input, ABS_MT_PRESSURE, 0, 64, 0, 0);
> @@ -802,8 +808,11 @@ static int alps_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		break;
>  	case HID_DEVICE_ID_ALPS_U1_DUAL:
>  	case HID_DEVICE_ID_ALPS_U1:
> +		data->dev_type = U1;
> +		break;
>  	case HID_DEVICE_ID_ALPS_1657:
>  		data->dev_type = U1;
> +		data->no_pitch = 1;
>  		break;
>  	default:
>  		data->dev_type = UNKNOWN;
> -- 
> 2.26.0
> 

-- 
Jiri Kosina
SUSE Labs

