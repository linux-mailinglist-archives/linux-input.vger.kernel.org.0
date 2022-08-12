Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC8E590F8F
	for <lists+linux-input@lfdr.de>; Fri, 12 Aug 2022 12:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238402AbiHLKhJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Aug 2022 06:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiHLKhJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Aug 2022 06:37:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 90887A1D21
        for <linux-input@vger.kernel.org>; Fri, 12 Aug 2022 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660300626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dkVJhpwPlGzaAqbScZcS+zSRlYMYU09C+t0LFojjLJE=;
        b=Bkw7+3Flu6gXk8HRZo/mYhQZAZ/eNslXkJZBsnuvtlz9Vwp4RvEQGuv5XZrNb6S3wOeh2J
        AGFRs/AgyTFDxyMEmi1hIGNfhZqc5D7gr+IXX1yRrEFlKkXNTkB9TEMFZTyOhV/zHryjVz
        /9L/1udp94y4OG5esIHJ/HUgVIsrQRo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-S7du5md0NlihxmVLgDrXdA-1; Fri, 12 Aug 2022 06:37:05 -0400
X-MC-Unique: S7du5md0NlihxmVLgDrXdA-1
Received: by mail-ej1-f69.google.com with SMTP id hv19-20020a17090760d300b00730d0a018a6so283993ejc.21
        for <linux-input@vger.kernel.org>; Fri, 12 Aug 2022 03:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=dkVJhpwPlGzaAqbScZcS+zSRlYMYU09C+t0LFojjLJE=;
        b=K3wSrXJDA5VuIDqIQvb+LshxNO6dlDzwG8dwk4JsSU0aG/ffuLwBqNURHz3HJhRMOA
         r2jCg5iGFYXyQVhpuPyPKd1j2pCa7vP180YP3OuulIvIJ+TXe254HaY3vjo5DfxGXMXS
         pl101qNBPnKlhqXOfVXOVkRmPThRwJ3Kgzv9NnlXPCaRIoHdzWuFZSaWV1Y/ByrSAK29
         vDZh01eu3MdrPLaKfAeW6/ONEBR8sEu0yIjxyMbt1HqUiTmszd2dLvct+ZVuKiXXAJUA
         9Pj5dg1hvY49mbf69n02CN9z6IZWGh2K+M+yMhwxUMvf9wYKuNuWQBs+alp1quBjzBj4
         kTIg==
X-Gm-Message-State: ACgBeo3Na7gwzGC/eGimgZZy9fj67iEqkRZwzHHtlXfenkT47/mkw7m0
        U8ABni7KOk+AkUOJ3niXNKelYNQfa792EfOppoVmv21RcAiE/rO3dPfF36dWBeEBFtx48SwPqok
        WkHE27vpn6MPA+YDYQWwIQGs=
X-Received: by 2002:a05:6402:3805:b0:43e:8335:3a2a with SMTP id es5-20020a056402380500b0043e83353a2amr3107981edb.296.1660300624000;
        Fri, 12 Aug 2022 03:37:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6mYmMrZckkuoNohYkG0kijb5vCT4Zd2QsSa+lyg7WWgJBZ1sUNslYYsWZe2quLUZtUybcSOg==
X-Received: by 2002:a05:6402:3805:b0:43e:8335:3a2a with SMTP id es5-20020a056402380500b0043e83353a2amr3107962edb.296.1660300623764;
        Fri, 12 Aug 2022 03:37:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709061e8600b006fec4ee28d0sm633412ejj.189.2022.08.12.03.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:37:02 -0700 (PDT)
Message-ID: <af6b5397-b442-17b0-4da9-78ba5f43fedc@redhat.com>
Date:   Fri, 12 Aug 2022 12:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2] Input: synaptics-rmi4 - filter incomplete relative
 packet.
Content-Language: en-US
To:     margeyang <marge.yang@synaptics.corp-partner.google.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com
References: <1660293805-16053-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1660293805-16053-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/12/22 10:43, margeyang wrote:
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
> ---
>  drivers/input/rmi4/rmi_f03.c | 83 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 79 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f03.c b/drivers/input/rmi4/rmi_f03.c
> index c194b1664b10..56b3e1129b51 100644
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
> @@ -87,7 +96,7 @@ static int rmi_f03_pt_write(struct serio *id, unsigned char val)
>  			__func__, error);
>  		return error;
>  	}
> -

Please keep the empty line you are removing here.

> +	f03->iwritecommandcounter++;
>  	return 0;
>  }
>  
> @@ -106,7 +115,8 @@ static int rmi_f03_initialize(struct f03_data *f03)
>  		dev_err(dev, "Failed to read query register (%d).\n", error);
>  		return error;
>  	}
> -

Please keep the empty line you are removing here.

(in general don't make any whitespace changes unrelated to your
changes. So if your changes are only adding code, don't delete
any whitespace)

> +	f03->iwritecommandcounter = 0;
> +	f03->ipacketindex = 0;
>  	f03->device_count = query1 & RMI_F03_DEVICE_COUNT;
>  	bytes_per_device = (query1 >> RMI_F03_BYTES_PER_DEVICE_SHIFT) &
>  				RMI_F03_BYTES_PER_DEVICE;
> @@ -284,6 +294,22 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
>  		ob_data = obs[i + RMI_F03_OB_DATA_OFFSET];
>  		serio_flags = 0;
>  
> +		if (ob_status & (RMI_F03_OB_FLAG_TIMEOUT | RMI_F03_OB_FLAG_PARITY)) {
> +			//  Send resend command to stick when timeout or parity error.
> +			//  Driver can receive the last stick packet.
> +
> +			error = rmi_write(f03->fn->rmi_dev, f03->fn->fd.data_base_addr,
> +			 RMI_F03_RESET_STYK);

please align the start of "RMI_F03_RESET_STYK" with the '(' of "rmi_write(".


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
> @@ -298,9 +324,58 @@ static irqreturn_t rmi_f03_attention(int irq, void *ctx)
>  			serio_flags & SERIO_TIMEOUT ?  'Y' : 'N',
>  			serio_flags & SERIO_PARITY ? 'Y' : 'N');
>  
> -		serio_interrupt(f03->serio, ob_data, serio_flags);
> +		if (f03->iwritecommandcounter > 0) {
> +			// Read Acknowledge Byte after writing the PS2 command.
> +			// It is not trackpoint data.
> +			serio_interrupt(f03->serio, ob_data, serio_flags);
> +

Why the extra empty line here? please drop this.

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
> +				goto exit;

You can just use break; here as you did before, please switch back to break;

> +			} else if ((f03->ipacketindex == 0) && !(ob_data & BIT(3))) {
> +				dev_err(&f03->fn->dev,
> +				"%s: New BIT 3 is not 1 for the first byte\n",
> +				__func__);
> +				goto exit;

You can just use break; here as you did before, please switch back to break;

> +			} else {
> +				if (f03->ipacketindex >= RELATIVE_PACKET_SIZE)
> +					f03->ipacketindex = 0;
> +
> +				f03->ob_dataArry[f03->ipacketindex] = ob_data;
> +				f03->serio_flagsArry[f03->ipacketindex] = serio_flags;
> +				f03->ipacketindex++;
> +
> +				if (f03->ipacketindex == RELATIVE_PACKET_SIZE)	{
> +					serio_interrupt(f03->serio, f03->ob_dataArry[0],
> +					 f03->serio_flagsArry[0]);
> +					serio_interrupt(f03->serio, f03->ob_dataArry[1],
> +					 f03->serio_flagsArry[1]);
> +					serio_interrupt(f03->serio, f03->ob_dataArry[2],
> +					 f03->serio_flagsArry[2]);
> +					f03->ipacketindex = 0;
> +				}
> +			}
> +		}
> +	}
> +exit:
> +	if (f03->iwritecommandcounter > 0) {
> +		f03->ipacketindex = 0;
> +		f03->iwritecommandcounter = f03->iwritecommandcounter - 1;
>  	}
> -

Please keep the empty line you are removing here.

>  	return IRQ_HANDLED;
>  }
>  

Other then the few minor style issues above this looks good to me.

Regards,

Hans

