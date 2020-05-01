Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0448E1C1CCF
	for <lists+linux-input@lfdr.de>; Fri,  1 May 2020 20:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729953AbgEASVG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 May 2020 14:21:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24064 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729138AbgEASVF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 1 May 2020 14:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588357263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MMR6l4k4zNeBx+Wvw1UIdeznRmOhrhGHDU+pU6egSYQ=;
        b=eQYaXkA8qNhhrHPPmNL+T88LSVXmbqW7pqV3L+BoHmSVh0isGWUN3epzu6Hd6hKhZrCfyp
        3mKYAj6JVj+eSrd4wV2NG7XMcpEa5lwF1C60MKmmyLfmUPsWfrBrp7HoP/NGYiS9syVLSf
        bSwscj8WeXriksWuWEbHnzaPL5+o/4o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-j2xVhhjxN2uuR4rGZniARw-1; Fri, 01 May 2020 14:21:01 -0400
X-MC-Unique: j2xVhhjxN2uuR4rGZniARw-1
Received: by mail-wr1-f70.google.com with SMTP id r11so6032006wrx.21
        for <linux-input@vger.kernel.org>; Fri, 01 May 2020 11:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MMR6l4k4zNeBx+Wvw1UIdeznRmOhrhGHDU+pU6egSYQ=;
        b=rvlfde3+XbOKpTaQ4Z7hj+W7sgiC1x3fmzlnx6KO3rhMwNagJ1y2FL6YPUuxwqDkn1
         7T7WZNeTX7Fxmdtb7PsC6QvZ3ckX36+VaXGB16ICvojf+Ys+ikO82lkNBwytwD6nQqFv
         s69Cw4SEYAZB69BQbL9ddbIxy6PHrfSoQipir0PDg3UkIahc3t+erRduGst1TpBcP24R
         nXectY2JdgS8/X0b4YWDwKzf7TrhH5qH0MKm/d+Zmr2YwPrSCBDs+ifU85VXFypA83iC
         pEWyU7C8rOB/TsDF5zf1IjkkQHYL3ixYL2vOtIkxEgO2XOud5S2gjg5B64TeNoK3DaUI
         Retg==
X-Gm-Message-State: AGi0PuY8xJQR1h1bmXuoLXdPnJjd4GAwVduCdHH6fTIp4kwn8xnDDPDe
        5KWHYVjf6Zi8IGFqoRso0sSo+LWzVXHbrudXobdA8uFqQNXA70Y1l/YpQc9U2nv2Ugy2f4frdsR
        ZVv3T00kqjRHLv3Y3Pmpzass=
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr5151937wrn.89.1588357260615;
        Fri, 01 May 2020 11:21:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypIitqX9LurQ/vDdOBxlgn3P3aYCkUaDsc1M3KMLGgFrWATGf4dwwYVUVNvIOrclNfQ5U6hBfQ==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr5151926wrn.89.1588357260412;
        Fri, 01 May 2020 11:21:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q17sm505013wmj.45.2020.05.01.11.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 11:20:59 -0700 (PDT)
Subject: Re: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to
 MT_CLS_WIN_8 quirks
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20200501095624.121744-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
Date:   Fri, 1 May 2020 20:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200501095624.121744-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 5/1/20 11:56 AM, Hans de Goede wrote:
> The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
> capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
> correctly binds to it.
> 
> But instead of getting multi-touch HID input reports we still get mouse
> input reports and corresponding linux input (evdev) node events.
> 
> Unloading and reloading the hid-multitouch driver works around this.
> 
> Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
> makes the driver work correctly the first time it is loaded.
> 
> I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
> because it seems unlikely that this quirk will causes problems for
> other MT_CLS_WIN_8 devices and if this device needs it other Win 8
> compatible devices might need it too.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Self nack for now, there are more issues with this detachable keyboard,
it sometimes does not work after being unplugged and replugged again
USB_QUIRK_DELAY_INIT seems to help a bit, but is not a total solution...

Dell has some firmware updates for the kbd. So I'll install Windows and
then update the firmware and we'll see from there.

Regards,

Hans



> ---
>   drivers/hid/hid-multitouch.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 362805ddf377..f9c0429e7348 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -265,6 +265,7 @@ static const struct mt_class mt_classes[] = {
>   			MT_QUIRK_IGNORE_DUPLICATES |
>   			MT_QUIRK_HOVERING |
>   			MT_QUIRK_CONTACT_CNT_ACCURATE |
> +			MT_QUIRK_FORCE_GET_FEATURE |
>   			MT_QUIRK_STICKY_FINGERS |
>   			MT_QUIRK_WIN8_PTP_BUTTONS,
>   		.export_all_inputs = true },
> 

