Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01EF5970C4
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 16:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbiHQOMQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 10:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240046AbiHQOMH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 10:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DB04D83E
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660745520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XqkeW1ALrZo+zcwi/VmVo+lezZAqkHWmVwQoquKFh0Q=;
        b=IYe+8QuxyJSyDWMwEuvBrbzXKnCd3qeMR5O6N8zOQAlL6+tygV4v68aDY32udloTsQ5C/P
        CUisELWPjG+0ENz9UPlBR62app1X+nYgVIxeV7lHV2Zlzinf08DGKa5G9wnjVjmk7YfZSB
        2g07b0Y+GcXEbS36HQfkib8hA/Rqsdc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-YA01yydwNh-CiGaUXJndVg-1; Wed, 17 Aug 2022 10:11:54 -0400
X-MC-Unique: YA01yydwNh-CiGaUXJndVg-1
Received: by mail-ej1-f71.google.com with SMTP id sc31-20020a1709078a1f00b0073096c2b4e1so3057287ejc.22
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 07:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XqkeW1ALrZo+zcwi/VmVo+lezZAqkHWmVwQoquKFh0Q=;
        b=0UD9hRLy3p6AmQqvEK+EAZEuuovE4lZ7ROLwnoyFFLCtPTo1UQYmV4XrMEfTqTh8s0
         3D3LmeqnUP7G87Kuv7RUNghY7m4YwF4d0oQiUVAWJ6tSqzACZeuYRSglm4KhC7G1J9tl
         GX9DZ2O2As/+ma4W6jnqCvQS0qab/7nKpNHL/nyd5Qex163zdaHhjiaI1sBuc9fq4GR7
         1j5dMgpTXtcmUZ2DBoW1yZJZLgJNP2YgeDJXOZ6fInApcNZvyOAbz+cjmYHEn1I3Ty0U
         dxAxWAU5JR7BZ4Pi6lpXfaiBtNPcxBYZCn1/p8Y8cGDDVT2/TuiQexP9KWb2F0WgHCXN
         QBcA==
X-Gm-Message-State: ACgBeo0c19HweDbb27mFRBDQSceppDQ5P9hFar5uIIvTqqR66nYgsyXH
        ipLZn5A+jYKMDPYT3NjU7FS6J+nh1rIUrUFlIW7g2v0jEVqT+yN0QmSVNEV/n4CnK3prqLg3Fmj
        nOgwuXyYldLqXnybAI+Kv/E0=
X-Received: by 2002:a05:6402:270c:b0:43d:efd3:883e with SMTP id y12-20020a056402270c00b0043defd3883emr24322839edd.221.1660745513409;
        Wed, 17 Aug 2022 07:11:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4W/cVcry9BxMteRtuuSnqe/Sl1kcfew9TRDzLjgxGqKvpSmoTrV1wuP2mWPooajKMt7Az4Gg==
X-Received: by 2002:a05:6402:270c:b0:43d:efd3:883e with SMTP id y12-20020a056402270c00b0043defd3883emr24322819edd.221.1660745513176;
        Wed, 17 Aug 2022 07:11:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ek6-20020a056402370600b0043a61f6c389sm10770528edb.4.2022.08.17.07.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 07:11:52 -0700 (PDT)
Message-ID: <7900c762-db8b-7c76-76eb-2b8d7e07459e@redhat.com>
Date:   Wed, 17 Aug 2022 16:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V4] Input: synaptics-rmi4 - filter incomplete relative
 packet.
Content-Language: en-US
To:     margeyang <marge.yang@synaptics.corp-partner.google.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com
References: <1660641649-11929-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1660641649-11929-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/16/22 11:20, margeyang wrote:
> From: Marge Yang <marge.yang@synaptics.corp-partner.google.com>
> 
> RMI4 F03 supports the Stick function,
> it's designed to support relative packet.
> This patch supports the following case.
> When relative packet can't be reported completely,
> it may miss one byte or two byte.
> New Synaptics firmware will report PARITY error.
> When timeout error or parity error happens,
> RMI4 driver will sends 0xFE command and
> ask FW to Re-send stick packet again.
> 
> Signed-off-by: Marge Yang<marge.yang@synaptics.corp-partner.google.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

note I see that Dmitry still has questions about this, so my
Reviewed-by is in no way a guarantee that this will get merged.

Please make sure to answer Dmitry's questions about this.


Regards,

Hans

> ---
>  drivers/input/rmi4/rmi_f03.c | 74 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f03.c b/drivers/input/rmi4/rmi_f03.c
> index c194b1664b10..563b40c2dc06 100644
> --- a/drivers/input/rmi4/rmi_f03.c
> +++ b/drivers/input/rmi4/rmi_f03.c
> @@ -23,8 +23,12 @@
>  #define RMI_F03_BYTES_PER_DEVICE_SHIFT	4
>  #define RMI_F03_QUEUE_LENGTH		0x0F
>  
> +#define RMI_F03_RESET_STYK		0xFE
> +
>  #define PSMOUSE_OOB_EXTRA_BTNS		0x01
>  
> +#define RELATIVE_PACKET_SIZE		3
> +
>  struct f03_data {
>  	struct rmi_function *fn;
>  
> @@ -33,6 +37,11 @@ struct f03_data {
>  
>  	unsigned int overwrite_buttons;
>  
> +	int iwritecommandcounter;
> +	unsigned int ipacketindex;
> +	unsigned int serio_flagsArry[RELATIVE_PACKET_SIZE];
> +	u8 ob_dataArry[RELATIVE_PACKET_SIZE];
> +
>  	u8 device_count;
>  	u8 rx_queue_length;
>  };
> @@ -88,6 +97,7 @@ static int rmi_f03_pt_write(struct serio *id, unsigned char val)
>  		return error;
>  	}
>  
> +	f03->iwritecommandcounter++;
>  	return 0;
>  }
>  
> @@ -107,6 +117,8 @@ static int rmi_f03_initialize(struct f03_data *f03)
>  		return error;
>  	}
>  
> +	f03->iwritecommandcounter = 0;
> +	f03->ipacketindex = 0;
>  	f03->device_count = query1 & RMI_F03_DEVICE_COUNT;
>  	bytes_per_device = (query1 >> RMI_F03_BYTES_PER_DEVICE_SHIFT) &
>  				RMI_F03_BYTES_PER_DEVICE;
> @@ -284,6 +296,22 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
>  		ob_data = obs[i + RMI_F03_OB_DATA_OFFSET];
>  		serio_flags = 0;
>  
> +		if (ob_status & (RMI_F03_OB_FLAG_TIMEOUT | RMI_F03_OB_FLAG_PARITY)) {
> +			//  Send resend command to stick when timeout or parity error.
> +			//  Driver can receive the last stick packet.
> +			unsigned char val = RMI_F03_RESET_STYK;
> +
> +			error = rmi_write(f03->fn->rmi_dev, f03->fn->fd.data_base_addr, val);
> +			if (error) {
> +				dev_err(&f03->fn->dev,
> +					"%s: Failed to rmi_write to F03 TX register (%d).\n",
> +					__func__, error);
> +				return error;
> +			}
> +			f03->ipacketindex = 0;
> +			break;
> +		}
> +
>  		if (!(ob_status & RMI_F03_RX_DATA_OFB))
>  			continue;
>  
> @@ -298,7 +326,51 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
>  			serio_flags & SERIO_TIMEOUT ?  'Y' : 'N',
>  			serio_flags & SERIO_PARITY ? 'Y' : 'N');
>  
> -		serio_interrupt(f03->serio, ob_data, serio_flags);
> +		if (f03->iwritecommandcounter > 0) {
> +			// Read Acknowledge Byte after writing the PS2 command.
> +			// It is not trackpoint data.
> +			serio_interrupt(f03->serio, ob_data, serio_flags);
> +		} else {
> +			//   The relative-mode PS/2 packet format is as follows:
> +			//
> +			//              bit position            position (as array of bytes)
> +			//     7   6   5   4   3   2   1   0
> +			//   =================================+
> +			//    Yov Xov DY8 DX8  1   M   R   L  | DATA[0]
> +			//                DX[7:0]             | DATA[1]
> +			//                DY[7:0]             | DATA[2]
> +			//   =================================+
> +			//		Yov: Y overflow
> +			//    Xov: X overflow
> +			if ((f03->ipacketindex == 0) && (ob_data & ((BIT(7)|BIT(6))))) {
> +				dev_err(&f03->fn->dev,
> +				"%s: X or Y is overflow. (%x)\n",
> +				__func__, ob_data);
> +				break;
> +			} else if ((f03->ipacketindex == 0) && !(ob_data & BIT(3))) {
> +				dev_err(&f03->fn->dev,
> +				"%s: New BIT 3 is not 1 for the first byte\n",
> +				__func__);
> +				break;
> +			}
> +			f03->ob_dataArry[f03->ipacketindex] = ob_data;
> +			f03->serio_flagsArry[f03->ipacketindex] = serio_flags;
> +			f03->ipacketindex++;
> +
> +			if (f03->ipacketindex == RELATIVE_PACKET_SIZE)	{
> +				serio_interrupt(f03->serio, f03->ob_dataArry[0],
> +				 f03->serio_flagsArry[0]);
> +				serio_interrupt(f03->serio, f03->ob_dataArry[1],
> +				 f03->serio_flagsArry[1]);
> +				serio_interrupt(f03->serio, f03->ob_dataArry[2],
> +				 f03->serio_flagsArry[2]);
> +				f03->ipacketindex = 0;
> +			}
> +		}
> +	}
> +	if (f03->iwritecommandcounter > 0) {
> +		f03->ipacketindex = 0;
> +		f03->iwritecommandcounter = f03->iwritecommandcounter - 1;
>  	}
>  
>  	return IRQ_HANDLED;

