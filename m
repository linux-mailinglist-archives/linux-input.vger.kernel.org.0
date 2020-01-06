Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9965D130BEC
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2020 02:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbgAFBxr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sun, 5 Jan 2020 20:53:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55889 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbgAFBxq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Jan 2020 20:53:46 -0500
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1ioHaS-0003pV-NP
        for linux-input@vger.kernel.org; Mon, 06 Jan 2020 01:53:44 +0000
Received: by mail-wr1-f71.google.com with SMTP id c17so1396239wrp.10
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2020 17:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aplBudq8rCxlCvhRC+PlNxRLQg8mVG6pG5DyVN/SbB8=;
        b=sSkm0lO4TT6uIGa45ODOcyOFWXU/B0gB2NzLH7fyy8Uj2TJKDoBvIePblvRvDW3dGl
         O3ekZw8sMfmbAXDp4oPGihU1oJ0994o5gIUOJ61Xaym7uuJvsQ9/q2wDx7+zy7yB9eVS
         uKl1cQp424HCYjBaY4MINE1PmNY2m06M1QnwJtnLUfY41UyrhH/dODsmjCPrdT7dk9ig
         Gg04zuiBMdJXKelsCB8i1iVLBoxnMRQXqK3j+xl/NilFPZ3ZMaOeyiUoqLTz73wsWB5r
         q7zQpC1lPHyioXmu7JRqFUCsUUjy5601LmG7S2scZRjOrsetEkslC9qYVJ5XIXI6N8CI
         +lMw==
X-Gm-Message-State: APjAAAVFZVepWoFgiHD9E3nTWJ+sSlCE2Yacr14+9GZdeRlyg8OUsN29
        SimAXSeBq327jTIfaUSgC7fbIQzxNcPlxjsC0GTKg4NHWd17iIYAue7KuZ3zE9lH3NmYseitOqk
        iUr1rDLSNG+TWrynxwl8BWIVKIP54mqqbItNpfe3OV5AWZgsICeFhSY7O
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr31193122wmd.102.1578275624201;
        Sun, 05 Jan 2020 17:53:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwX09GIJKZNyYI69L6r9jLkI+iVSKaZnlKCDaOl4lRD7lj9a/4lLmfP/8ZxEOSxoSNKeqTIPc7S/y0lUL76CNw=
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr31193100wmd.102.1578275623954;
 Sun, 05 Jan 2020 17:53:43 -0800 (PST)
MIME-Version: 1.0
References: <CAFv23QmiDdhe+xJw2y7CXiWq4-GK1S-1bcKxEpNhNJu3ZtzA_w@mail.gmail.com>
 <9baeb165eddb4872fb701ff81f11692b7e153bf6.camel@hadess.net>
 <CAFv23Qmj_ZqKs9_tw1Grzzj5unFBLfK0Scy396vcHCEB+fdLOA@mail.gmail.com>
 <7830ad25a5cb7640e1da55c4278ce73c1ff3e0ad.camel@linux.intel.com>
 <CAFv23Q=aOq1YCQnW7r_eSRn1COfpvQkfjtK2+a3zU0ggxnuYew@mail.gmail.com> <19ec09f45d1728c852ff30c7a6c18d9aca826923.camel@linux.intel.com>
In-Reply-To: <19ec09f45d1728c852ff30c7a6c18d9aca826923.camel@linux.intel.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Mon, 6 Jan 2020 09:53:32 +0800
Message-ID: <CAFv23QnngVCQQX7OEnBZG2DMUZFmd6ct69YAtYN-OGgoJbtH1w@mail.gmail.com>
Subject: Re: Display got wrong rotation after hid_sensor_accel_3d is loaded
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

Quick update, ODM BIOS admits it's a BIOS issue, and they will fix
this from BIOS side.
Thanks all.

Best regards,
AceLan Kao.

Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> 於 2020年1月3日
週五 上午1:43寫道：
>
> On Thu, 2020-01-02 at 10:46 +0800, AceLan Kao wrote:
> > Yes, this machine will be sold with Windows, but currently we didn't
> > hear any issues from Windows side.
> There are custom sensors, which probably getting used by Windows
> instead of accel_3d. I didn't see any special fields in accel_3d.
>
> Thanks,
> Srinivas
>
> > Here is the rdesc I found under /sys/kernel/debug/hid
> >
> > BTW, we're trying to push BIOS to provide some useful info about the
> > orientation of the sensor, so that we don't have to list those
> > machines in the driver.
> >
> > Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com> 於
> > 2019年12月31日 週二 上午1:18寫道：
> > > Hi Kao,
> > >
> > > Is this device sold with Windows?
> > > Can you send full report descriptor (You can get from
> > > /sys/kernel/debug/hid)?
> > >
> > > Thanks,
> > > Srinivas
> > >
> > > On Fri, 2019-12-27 at 10:30 +0800, AceLan Kao wrote:
> > > > Hi Bastien,
> > > >
> > > > Thanks for your suggestion.
> > > > I just tried to add the following line into
> > > > /lib/udev/hwdb.d/60-sensor.hwdb and got the correct screen
> > > > rotation.
> > > > But the cursor is still un-rotated, the cursor is drawn upside
> > > > down,
> > > > and its coordinates are inverted.
> > > >
> > > > #########################################
> > > > # STMicro
> > > > #########################################
> > > > sensor:modalias:platform:platform:HID-SENSOR-200073
> > > >  ACCEL_MOUNT_MATRIX=-1, 0, 0; 0, -1, 0; 0, 0, 1
> > > >
> > > > It looks like we should introduce a quirk into
> > > > hid_sensor_accel_3d
> > > > driver.
> > > > There are 3 different scale variables in hid_sensor_accel_3d, but
> > > > I
> > > > don't see any of them would work the way I want.
> > > > Do you mean to introduce new scale variables?
> > > >
> > > >    drivers/iio/accel/hid-sensor-accel-3d.c:34:     int
> > > > scale_pre_decml;
> > > >    drivers/iio/accel/hid-sensor-accel-3d.c:35:     int
> > > > scale_post_decml;
> > > >    drivers/iio/accel/hid-sensor-accel-3d.c:36:     int
> > > > scale_precision;
> > > >
> > > > Bastien Nocera <hadess@hadess.net> 於 2019年12月26日 週四 下午11:03寫道：
> > > > > On Thu, 2019-12-26 at 17:22 +0800, AceLan Kao wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > I'm working on a new platform which comes with an accelerator
> > > > > > meter.
> > > > > > It's a STMicroelectronics LSM6DS3US accelerator meter, it
> > > > > > doesn't
> > > > > > use
> > > > > > st_sensors driver, but hid_sensor_accel_3d.
> > > > > > After hid_sensor_accel_3d is loaded, the display becomes
> > > > > > upside
> > > > > > down,
> > > > > > so I tried to add some code to make it become normal.(ACCEL_X
> > > > > > should
> > > > > > have the same modification)
> > > > > >
> > > > > > I don't know how to fix this in a correct way, please give me
> > > > > > some
> > > > > > hints.
> > > > >
> > > > > This needs to be done as a quirk, either by applying a quirk
> > > > > for
> > > > > the
> > > > > HID descriptors (which should have a definition of the scale,
> > > > > which
> > > > > would be negative for this device), or in user-space in
> > > > > systemd's
> > > > > hwdb
> > > > > database, which your user-space consumers need to take care of:
> > > > >
> > > https://github.com/systemd/systemd/blob/master/hwdb.d/60-sensor.hwdb
> > > > > Cheers
> > > > >
>
