Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA0CF206B
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 22:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfKFVKX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 16:10:23 -0500
Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com ([46.30.212.2]:17771
        "EHLO mailrelay3-2.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727399AbfKFVKX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 Nov 2019 16:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmath.org; s=20140924;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:from:references:cc:to:subject:from;
        bh=4+RTek27QBVcIe/cdkCy2pe8OGRWOH0S5ORmdwUyo30=;
        b=iGM7AeIepsnEM1adlQI2SZpebCSTEXL6ESCJ9k0jEXLS3VHNrhhtkLBEVQiT4Vz4ZLww7LYNlSBXc
         SRRN4o6+1pvV/9titRXaHIAh4Lap1tSGBvUzxacYEI/5OAplQqIhnN4avtRhx2iURrIhiIY6nKq+Gu
         8CnFhXJLUim3KCew=
X-HalOne-Cookie: 1e9321a08137a81d8fd412420f3d1a74df673a1c
X-HalOne-ID: d5042bd6-00d9-11ea-b5f1-d0431ea8bb03
Received: from [192.168.19.13] (unknown [98.128.166.87])
        by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id d5042bd6-00d9-11ea-b5f1-d0431ea8bb03;
        Wed, 06 Nov 2019 21:10:17 +0000 (UTC)
Subject: Re: [PATCH v5 01/48] Input: introduce input_mt_report_slot_inactive
To:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        nick@shmanahar.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20191106070146.18759-1-jiada_wang@mentor.com>
 <20191106070146.18759-2-jiada_wang@mentor.com>
From:   Henrik Rydberg <rydberg@bitmath.org>
Message-ID: <bb392c48-3d1e-cb79-046b-355b12331e8a@bitmath.org>
Date:   Wed, 6 Nov 2019 22:11:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191106070146.18759-2-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019-11-06 08:00, Jiada Wang wrote:

> input_mt_report_slot_state() ignores the tool when the slot is closed.
> which has caused a bit of confusion.
> This patch introduces input_mt_report_slot_inactive() to report slot
> inactive state.
> replaces all input_mt_report_slot_state() with
> input_mt_report_slot_inactive() in case of close of slot.
>
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>

     Reviewed-by: Henrik Rydberg <rydberg@bitmath.org>

Thanks,
Henrik

> ---
>   drivers/hid/hid-alps.c                     | 3 +--
>   drivers/hid/hid-multitouch.c               | 6 ++----
>   drivers/input/input-mt.c                   | 2 +-
>   drivers/input/misc/xen-kbdfront.c          | 2 +-
>   drivers/input/mouse/elan_i2c_core.c        | 2 +-
>   drivers/input/touchscreen/atmel_mxt_ts.c   | 7 +++----
>   drivers/input/touchscreen/cyttsp4_core.c   | 5 ++---
>   drivers/input/touchscreen/cyttsp_core.c    | 2 +-
>   drivers/input/touchscreen/melfas_mip4.c    | 4 ++--
>   drivers/input/touchscreen/mms114.c         | 2 +-
>   drivers/input/touchscreen/raspberrypi-ts.c | 2 +-
>   drivers/input/touchscreen/stmfts.c         | 2 +-
>   include/linux/input/mt.h                   | 5 +++++
>   13 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
> index ae79a7c66737..36ca1d815d53 100644
> --- a/drivers/hid/hid-alps.c
> +++ b/drivers/hid/hid-alps.c
> @@ -387,8 +387,7 @@ static int u1_raw_event(struct alps_dev *hdata, u8 *data, int size)
>   				input_report_abs(hdata->input,
>   					ABS_MT_PRESSURE, z);
>   			} else {
> -				input_mt_report_slot_state(hdata->input,
> -					MT_TOOL_FINGER, 0);
> +				input_mt_report_slot_inactive(hdata->input);
>   			}
>   		}
>   
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 3cfeb1629f79..15e6c04a76dd 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -896,7 +896,7 @@ static void mt_release_pending_palms(struct mt_device *td,
>   		clear_bit(slotnum, app->pending_palm_slots);
>   
>   		input_mt_slot(input, slotnum);
> -		input_mt_report_slot_state(input, MT_TOOL_PALM, false);
> +		input_mt_report_slot_inactive(input);
>   
>   		need_sync = true;
>   	}
> @@ -1640,9 +1640,7 @@ static void mt_release_contacts(struct hid_device *hid)
>   		if (mt) {
>   			for (i = 0; i < mt->num_slots; i++) {
>   				input_mt_slot(input_dev, i);
> -				input_mt_report_slot_state(input_dev,
> -							   MT_TOOL_FINGER,
> -							   false);
> +				input_mt_report_slot_inactive(input_dev);
>   			}
>   			input_mt_sync_frame(input_dev);
>   			input_sync(input_dev);
> diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
> index a81e14148407..7626fe5bfe44 100644
> --- a/drivers/input/input-mt.c
> +++ b/drivers/input/input-mt.c
> @@ -145,7 +145,7 @@ bool input_mt_report_slot_state(struct input_dev *dev,
>   	slot->frame = mt->frame;
>   
>   	if (!active) {
> -		input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
> +		input_mt_report_slot_inactive(dev);
>   		return false;
>   	}
>   
> diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> index 24bc5c5d876f..a1bba722b234 100644
> --- a/drivers/input/misc/xen-kbdfront.c
> +++ b/drivers/input/misc/xen-kbdfront.c
> @@ -146,7 +146,7 @@ static void xenkbd_handle_mt_event(struct xenkbd_info *info,
>   		break;
>   
>   	case XENKBD_MT_EV_UP:
> -		input_mt_report_slot_state(info->mtouch, MT_TOOL_FINGER, false);
> +		input_mt_report_slot_inactive(info->mtouch);
>   		break;
>   
>   	case XENKBD_MT_EV_SYN:
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 8719da540383..3f9354baac4b 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -938,7 +938,7 @@ static void elan_report_contact(struct elan_tp_data *data,
>   		input_report_abs(input, ABS_MT_TOUCH_MINOR, minor);
>   	} else {
>   		input_mt_slot(input, contact_num);
> -		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
> +		input_mt_report_slot_inactive(input);
>   	}
>   }
>   
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 24c4b691b1c9..6e758af343ea 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -822,8 +822,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
>   		 * have happened.
>   		 */
>   		if (status & MXT_T9_RELEASE) {
> -			input_mt_report_slot_state(input_dev,
> -						   MT_TOOL_FINGER, 0);
> +			input_mt_report_slot_inactive(input_dev);
>   			mxt_input_sync(data);
>   		}
>   
> @@ -839,7 +838,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
>   		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, area);
>   	} else {
>   		/* Touch no longer active, close out slot */
> -		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, 0);
> +		input_mt_report_slot_inactive(input_dev);
>   	}
>   
>   	data->update_input = true;
> @@ -947,7 +946,7 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>   		dev_dbg(dev, "[%u] release\n", id);
>   
>   		/* close out slot */
> -		input_mt_report_slot_state(input_dev, 0, 0);
> +		input_mt_report_slot_inactive(input_dev);
>   	}
>   
>   	data->update_input = true;
> diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
> index 4b22d49a0f49..a3a85e2348a2 100644
> --- a/drivers/input/touchscreen/cyttsp4_core.c
> +++ b/drivers/input/touchscreen/cyttsp4_core.c
> @@ -744,8 +744,7 @@ static void cyttsp4_report_slot_liftoff(struct cyttsp4_mt_data *md,
>   
>   	for (t = 0; t < max_slots; t++) {
>   		input_mt_slot(md->input, t);
> -		input_mt_report_slot_state(md->input,
> -			MT_TOOL_FINGER, false);
> +		input_mt_report_slot_inactive(md->input);
>   	}
>   }
>   
> @@ -845,7 +844,7 @@ static void cyttsp4_final_sync(struct input_dev *input, int max_slots, int *ids)
>   		if (ids[t])
>   			continue;
>   		input_mt_slot(input, t);
> -		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
> +		input_mt_report_slot_inactive(input);
>   	}
>   
>   	input_sync(input);
> diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
> index 3f5d463dbeed..697aa2c158f7 100644
> --- a/drivers/input/touchscreen/cyttsp_core.c
> +++ b/drivers/input/touchscreen/cyttsp_core.c
> @@ -340,7 +340,7 @@ static void cyttsp_report_tchdata(struct cyttsp *ts)
>   			continue;
>   
>   		input_mt_slot(input, i);
> -		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
> +		input_mt_report_slot_inactive(input);
>   	}
>   
>   	input_sync(input);
> diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> index 247c3aaba2d8..f67efdd040b2 100644
> --- a/drivers/input/touchscreen/melfas_mip4.c
> +++ b/drivers/input/touchscreen/melfas_mip4.c
> @@ -391,7 +391,7 @@ static void mip4_clear_input(struct mip4_ts *ts)
>   	/* Screen */
>   	for (i = 0; i < MIP4_MAX_FINGERS; i++) {
>   		input_mt_slot(ts->input, i);
> -		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, 0);
> +		input_mt_report_slot_inactive(ts->input);
>   	}
>   
>   	/* Keys */
> @@ -534,7 +534,7 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
>   	} else {
>   		/* Release event */
>   		input_mt_slot(ts->input, id);
> -		input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, 0);
> +		input_mt_report_slot_inactive(ts->input);
>   	}
>   
>   	input_mt_sync_frame(ts->input);
> diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
> index a5ab774da4cc..8112bd77afae 100644
> --- a/drivers/input/touchscreen/mms114.c
> +++ b/drivers/input/touchscreen/mms114.c
> @@ -550,7 +550,7 @@ static int __maybe_unused mms114_suspend(struct device *dev)
>   	/* Release all touch */
>   	for (id = 0; id < MMS114_MAX_TOUCH; id++) {
>   		input_mt_slot(input_dev, id);
> -		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, false);
> +		input_mt_report_slot_inactive(input_dev);
>   	}
>   
>   	input_mt_report_pointer_emulation(input_dev, true);
> diff --git a/drivers/input/touchscreen/raspberrypi-ts.c b/drivers/input/touchscreen/raspberrypi-ts.c
> index 69881265d121..147ea4f8f87b 100644
> --- a/drivers/input/touchscreen/raspberrypi-ts.c
> +++ b/drivers/input/touchscreen/raspberrypi-ts.c
> @@ -102,7 +102,7 @@ static void rpi_ts_poll(struct input_polled_dev *dev)
>   	released_ids = ts->known_ids & ~modified_ids;
>   	for_each_set_bit(i, &released_ids, RPI_TS_MAX_SUPPORTED_POINTS) {
>   		input_mt_slot(input, i);
> -		input_mt_report_slot_state(input, MT_TOOL_FINGER, 0);
> +		input_mt_report_slot_inactive(input);
>   		modified_ids &= ~(BIT(i));
>   	}
>   	ts->known_ids = modified_ids;
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index b6f95f20f924..b54cc64e4ea6 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -198,7 +198,7 @@ static void stmfts_report_contact_release(struct stmfts_data *sdata,
>   	u8 slot_id = (event[0] & STMFTS_MASK_TOUCH_ID) >> 4;
>   
>   	input_mt_slot(sdata->input, slot_id);
> -	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, false);
> +	input_mt_report_slot_inactive(sdata->input);
>   
>   	input_sync(sdata->input);
>   }
> diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
> index 9e409bb13642..3b8580bd33c1 100644
> --- a/include/linux/input/mt.h
> +++ b/include/linux/input/mt.h
> @@ -100,6 +100,11 @@ static inline bool input_is_mt_axis(int axis)
>   bool input_mt_report_slot_state(struct input_dev *dev,
>   				unsigned int tool_type, bool active);
>   
> +static inline void input_mt_report_slot_inactive(struct input_dev *dev)
> +{
> +	input_mt_report_slot_state(dev, 0, false);
> +}
> +
>   void input_mt_report_finger_count(struct input_dev *dev, int count);
>   void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count);
>   void input_mt_drop_unused(struct input_dev *dev);
