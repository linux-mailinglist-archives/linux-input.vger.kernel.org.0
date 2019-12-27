Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0781F12B0A1
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2019 03:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfL0CbJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 26 Dec 2019 21:31:09 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34129 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfL0CbI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Dec 2019 21:31:08 -0500
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1ikfP9-0005DT-C9
        for linux-input@vger.kernel.org; Fri, 27 Dec 2019 02:31:07 +0000
Received: by mail-wr1-f72.google.com with SMTP id v17so11611229wrm.17
        for <linux-input@vger.kernel.org>; Thu, 26 Dec 2019 18:31:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4dOBVgYzJQQlBZJLMRejwZCloWBaR9zdLSWOBrbs5HQ=;
        b=IviRYckFuvRdSpQ1cBfv8hmP6I4M1Ngs3w/Kxurz6hJ1VYtGoOPHNoEQe7v7g5MhUm
         NA99GJWeFn1Itd/K6D3rNETHrh+XObCxLGTKP9rTO2v0riOc1tlfkLGdobCD/AYFsgSs
         I8LXFPdbBI24oZoRh2tWFFHjzicEGOnS5gGHUEDHnH1snCK7FGB1Bo4o8b8M/3tCp68v
         5czdu03YBOnk4/y8lDrvVoBtln0GhkQVzZmXuHRYhHxXpd3aTEpxohM/vTgO2y+UbyKH
         GbxTgxfhl8SD9Viq9JbE/HnIoqKAf/tRfNDDHOQszFud4JN8vX6hTsj4R1a/8ESYYbCz
         xYMA==
X-Gm-Message-State: APjAAAUXf+vMcc4AiqtNduSZLNQT0MDRjARBOVPUTuKqNO0o9FdeCMpK
        63GhVE7AKFUGv8gBTCUNznK9rkHCAC7hANa38YKqvap77iuk7CprD7zXOhXUQz2TjIH7ql/lmKp
        aSMljlutNtPJyey0gnLwL6hO9hKZ35Zo0RWWgIIpyrtYnmNIPXPU8CTll
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr47804874wru.40.1577413867118;
        Thu, 26 Dec 2019 18:31:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyuFPeM4Ub4t48ORJovS5k1GwCHSAOYNZBKpzgCnLP5EZnMrkgJMqhcW1m8fLymTuVusm6+o3jA0mIqd3h9adM=
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr47804862wru.40.1577413866872;
 Thu, 26 Dec 2019 18:31:06 -0800 (PST)
MIME-Version: 1.0
References: <CAFv23QmiDdhe+xJw2y7CXiWq4-GK1S-1bcKxEpNhNJu3ZtzA_w@mail.gmail.com>
 <9baeb165eddb4872fb701ff81f11692b7e153bf6.camel@hadess.net>
In-Reply-To: <9baeb165eddb4872fb701ff81f11692b7e153bf6.camel@hadess.net>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Fri, 27 Dec 2019 10:30:55 +0800
Message-ID: <CAFv23Qmj_ZqKs9_tw1Grzzj5unFBLfK0Scy396vcHCEB+fdLOA@mail.gmail.com>
Subject: Re: Display got wrong rotation after hid_sensor_accel_3d is loaded
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastien,

Thanks for your suggestion.
I just tried to add the following line into
/lib/udev/hwdb.d/60-sensor.hwdb and got the correct screen rotation.
But the cursor is still un-rotated, the cursor is drawn upside down,
and its coordinates are inverted.

#########################################
# STMicro
#########################################
sensor:modalias:platform:platform:HID-SENSOR-200073
 ACCEL_MOUNT_MATRIX=-1, 0, 0; 0, -1, 0; 0, 0, 1

It looks like we should introduce a quirk into hid_sensor_accel_3d driver.
There are 3 different scale variables in hid_sensor_accel_3d, but I
don't see any of them would work the way I want.
Do you mean to introduce new scale variables?

   drivers/iio/accel/hid-sensor-accel-3d.c:34:     int scale_pre_decml;
   drivers/iio/accel/hid-sensor-accel-3d.c:35:     int scale_post_decml;
   drivers/iio/accel/hid-sensor-accel-3d.c:36:     int scale_precision;

Bastien Nocera <hadess@hadess.net> 於 2019年12月26日 週四 下午11:03寫道：
>
> On Thu, 2019-12-26 at 17:22 +0800, AceLan Kao wrote:
> > Hi all,
> >
> > I'm working on a new platform which comes with an accelerator meter.
> > It's a STMicroelectronics LSM6DS3US accelerator meter, it doesn't use
> > st_sensors driver, but hid_sensor_accel_3d.
> > After hid_sensor_accel_3d is loaded, the display becomes upside down,
> > so I tried to add some code to make it become normal.(ACCEL_X should
> > have the same modification)
> >
> > I don't know how to fix this in a correct way, please give me some
> > hints.
>
> This needs to be done as a quirk, either by applying a quirk for the
> HID descriptors (which should have a definition of the scale, which
> would be negative for this device), or in user-space in systemd's hwdb
> database, which your user-space consumers need to take care of:
> https://github.com/systemd/systemd/blob/master/hwdb.d/60-sensor.hwdb
>
> Cheers
>
