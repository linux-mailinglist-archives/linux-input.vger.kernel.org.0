Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60D2914F7A6
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2020 12:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgBALpE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Feb 2020 06:45:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32601 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726297AbgBALpE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 1 Feb 2020 06:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580557503;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yk+kTfcsf8R33615ncEr7TEpkv1k66QDIp747QRwuq4=;
        b=T0BCWsTZhEcJCycPYa/vQ/RnlqYQXD7mwXj8GNw1egE2pbHyAw1zDIGd1M3Kgm56QndbP0
        49Zx18Pil7t/sLi+fOcbDEYK6KGJA+FLvlqUin38ir4GkM+iFzz4CfD5HbIqJuN2USUiiV
        r9JZ1X9Nz0/a8Ga4WKkk73lrrzLFQ5Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-X1OEImPqNbWE4_awytg4UA-1; Sat, 01 Feb 2020 06:44:57 -0500
X-MC-Unique: X1OEImPqNbWE4_awytg4UA-1
Received: by mail-wm1-f72.google.com with SMTP id g26so3661137wmk.6
        for <linux-input@vger.kernel.org>; Sat, 01 Feb 2020 03:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yk+kTfcsf8R33615ncEr7TEpkv1k66QDIp747QRwuq4=;
        b=f6h+HW9yXTonnrqXgq/VVDJb0ytq02aqJeRx1op4w+IITAi9gnqnK4JaUrloSx6WZ/
         ZTqeGRpyJrvcrGGJ6ol3eMR7HeW+ODgIC/s1dvYqK+pWYm3Z400s7RRL4AjMxek2Mpb4
         gLHKETjRiEhtA6F8O9Q92yIn8VFSrtBVsRlqvIRXEmf2GWbshql2UDk+Tm2HkNkLFmpA
         8lU0dHVN4CArfqCHqxiiFuCkZFAnEzl7inROFst86G4Jppkyf3rZAj86Zfd0im7cBWoH
         GW9dq6EtQPMs9+OtiGVh5fwqC9YVxBpLwJpL8sAUMJ98z76DWA58CVyVf+5LSMyG6TMm
         06VQ==
X-Gm-Message-State: APjAAAVoqsHXC06xczSE8Q1al/Q0ouy9WVf+2dPumYq6QX4iPoUAmdsP
        SFZ8d4rda+DeWpuZfHkipQqzESJVEue4S9R3NeCPilPdgoO4L0bmhza92KarB9v9vOglGsOka3l
        y2f0Yy/DC28rsiDCK41toh2s=
X-Received: by 2002:adf:f491:: with SMTP id l17mr4677531wro.149.1580557496344;
        Sat, 01 Feb 2020 03:44:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTAT9FzEovuslbYDdF+Xd1DrQKjFRwIfDmXu/oWF6AVQyHD3ZW42b7/gpuAFi0OfcFn2tSoQ==
X-Received: by 2002:adf:f491:: with SMTP id l17mr4677516wro.149.1580557496148;
        Sat, 01 Feb 2020 03:44:56 -0800 (PST)
Received: from localhost.localdomain ([2001:67c:1810:f055:3fec:c198:3e12:89c7])
        by smtp.gmail.com with ESMTPSA id 5sm12298168wrc.75.2020.02.01.03.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2020 03:44:55 -0800 (PST)
Subject: Re: [PATCH] HID: ite: Only bind to keyboard USB interface on Acer
 SW5-012 keyboard dock
To:     Z R <zdenda.rampas@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
References: <20200131124553.27796-1-hdegoede@redhat.com>
 <CAO-hwJK-wwZ8UJRaBgjVc0ZXakU9C3eDbh+i6Q5vm8xh1P76LQ@mail.gmail.com>
 <ea896405-6784-7cfd-b27c-28e8ebc3cd7e@redhat.com>
 <CAO-hwJJ1v30NT5quobYawV9yv87buyrQXOG9u-nY3zXXSrCGvg@mail.gmail.com>
 <6d94cf74-c28f-08b0-a136-044c231b8bc5@redhat.com>
 <CAO-hwJ+o5CvU3Pv+dQV2gSTeF+n0AGkjwYJvWfX_ZYtM=OtH6g@mail.gmail.com>
 <CABHH5-LmC3JOWyDoxC5hizZe6RZ6RuO=-gk8WDXvU9Z2usihXg@mail.gmail.com>
 <fa288cc2-0560-1fa5-a629-20a7a33afeb2@redhat.com>
 <CABHH5-KNv7TU6=fiMk3JDxEX2mx7y9qr0Qx9sjOL9-=Rd5jsMw@mail.gmail.com>
 <CAO-hwJ+QnjLu1-Q_KneyOnpc-QaedYUdJUJHH-0E=Txv3kqy5Q@mail.gmail.com>
 <CABHH5-+MQZgj+Wz-BdHLJbK7X2dyyAES6KJspR=gK0TO0Dk73A@mail.gmail.com>
 <ae52762f-b743-de74-f978-7607a4f02eaf@redhat.com>
 <CABHH5-L0Ywc7nirnChy4YnGNeqhKa=_rXq9O5QUWtzWs1C6-_w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ac936152-26f7-2f43-5628-07691d9eda90@redhat.com>
Date:   Sat, 1 Feb 2020 12:44:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CABHH5-L0Ywc7nirnChy4YnGNeqhKa=_rXq9O5QUWtzWs1C6-_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/1/20 11:58 AM, Z R wrote:
> Good morning guys,
> ls -l /sys/bus/hid/devices/0003*/driver
> lrwxrwxrwx 1 root root 0 Feb  1 11:44 /sys/bus/hid/devices/0003:06CB:2968.0002/driver -> ../../../../../../../../bus/hid/drivers/itetech
> lrwxrwxrwx 1 root root 0 Feb  1 11:44 /sys/bus/hid/devices/0003:06CB:2968.0003/driver -> ../../../../../../../../bus/hid/drivers/hid-multitouch
> 
> ################################
> #      Waiting for events      #
> ################################
> E: 0.000001 0004 0004 458792    # EV_MSC / MSC_SCAN             458792
> E: 0.000001 0001 001c 0000      # EV_KEY / KEY_ENTER            0
> E: 0.000001 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- +0ms
> E: 4.068903 0001 00f7 0001      # EV_KEY / KEY_RFKILL           1
> E: 4.068903 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- +4068ms
> E: 4.068997 0001 00f7 0000      # EV_KEY / KEY_RFKILL           0
> E: 4.068997 0000 0000 0000      # ------------ SYN_REPORT (0) ---------- +0ms
> E: 17.695302 0001 00f7 0001     # EV_KEY / KEY_RFKILL           1
> E: 17.695302 0000 0000 0000     # ------------ SYN_REPORT (0) ---------- +13627ms
> E: 17.695395 0001 00f7 0000     # EV_KEY / KEY_RFKILL           0
> E: 17.695395 0000 0000 0000     # ------------ SYN_REPORT (0) ---------- +0ms
> E: 24.508532 0004 0004 458976   # EV_MSC / MSC_SCAN             458976
> E: 24.508532 0001 001d 0001     # EV_KEY / KEY_LEFTCTRL         1
> E: 24.508532 0000 0000 0000     # ------------ SYN_REPORT (0) ---------- +6813ms
> E: 24.744600 0004 0004 458758   # EV_MSC / MSC_SCAN             458758
> E: 24.744600 0001 002e 0001     # EV_KEY / KEY_C                1
> E: 24.744600 0000 0000 0000     # ------------ SYN_REPORT (0) ---------- +236ms
> 
> I pressed fn-f3 2x ... Wifi disabled, wifi enabled, on kernel patched with:
> -       { HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS,
> -                        USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
> +        { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +                     USB_VENDOR_ID_SYNAPTICS,
> +                     USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },

Great, so everything is working as it should with the simplified patch, I will go and
submit that to Benjamin then so that we can get this regression fixed.

Regards,

Hans

