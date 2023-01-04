Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8920D65DDD4
	for <lists+linux-input@lfdr.de>; Wed,  4 Jan 2023 21:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240287AbjADUrv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Jan 2023 15:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240002AbjADUru (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Jan 2023 15:47:50 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE48239F88
        for <linux-input@vger.kernel.org>; Wed,  4 Jan 2023 12:47:49 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id t15so37942637ybq.4
        for <linux-input@vger.kernel.org>; Wed, 04 Jan 2023 12:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTE1bFl+cC/U8SiQnRFDlPXXanuOj7zeeaZJOgyWL/Y=;
        b=IWshh4XYsQq+zM4QdDTSrsWx4kOU4XyjG52FnRqiNclSqnaXkjD4j+y8JIKJs2kNL2
         9AUyt86WtmGrhHGLM3wKxFjrJ8QZCmM2qFSsSZXUPyHRDKufq2hUi6/9byJ2Z2/78Lmg
         Q5uyKjaHgGNQB3U6Dcot4g4DszByppNg8ws9ImdjZS0HkivIc2LaOfBFPoXhEYF1Q5cL
         kGmO8YZ5nnRKK6VYBKc8gwc1HxtgbIkHqyFGNzAzHDh5bO2IHGWgL/wglucEZZLptmVm
         MRazU1YhGIC8rFFuVbtJdFtYb4kaG9AOBhZZ/cGZdihmWnfXD8YKAIqAgLQ6K4VQqIT8
         EjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTE1bFl+cC/U8SiQnRFDlPXXanuOj7zeeaZJOgyWL/Y=;
        b=pR67bNvhoF0+l/iLOoYXSGBfYY+3QyfvyaVWow3grjha/+H8HKtI4cKZem/u7wMgrs
         bhQDghk+amnLnS8a8E5D0EEUkrvUAszaSHYwlrLjDbTFsgkTNkVJNp5s0ryVfWa7JY/Z
         +cUaBj42BYZjTGspm1QGpEKsiBdRPRswZNNUQod5W1Nmwgo0UzSEdxMelO3kDZm91k5u
         T4t1sIfN3D0MhUBDHFN2tP//17pwja1oe0Su6iVRmeRH6Rb8KxtBuszjA11B+JNtq2bx
         JzgZrBPrig1YZEHyPuQpwmnowpD59fTg4gFSH9AsZPr8ZtXPTJLOuxKdjeJe6Kp5GqDy
         59Ug==
X-Gm-Message-State: AFqh2koaXbzZtTlReLCSbyTf8KhAYxGTZOfQ1bp48rbnc29kb3CVgPmV
        63OBoHLqh3g4yhdeTe3qZ/mSLxjBsZGsxqJSaxdReXIkMuY=
X-Google-Smtp-Source: AMrXdXvF8rycNLOsFBS+eyAC2/anKptABj+qm7Ydzb5+o+4XZqeIwfGYJZmRjlw1vqAmY6BAw1ZVhYqxrInFHkmzHmE=
X-Received: by 2002:a25:dd84:0:b0:6f3:6ba:b281 with SMTP id
 u126-20020a25dd84000000b006f306bab281mr5564169ybg.137.1672865268804; Wed, 04
 Jan 2023 12:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20221226000722.2xgbvsnrl6k7f7tk@ananas> <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas> <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas> <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
 <20221229192119.jy2q4xaipfplqjbd@ananas> <CAEc3jaAvAh__5AUwjat4qQzLzSsNCAncYQtEX5ExXX1Hxh9cLw@mail.gmail.com>
 <CAME7zCKPjFbE6nSSoQOVK=BnFG0YAvMgHjAmHKTXcxk3Weuo+w@mail.gmail.com> <CAEc3jaBz92QRKCs1Ckb0njDNMu4=CHZcUJ=MPif3Mzvw_Xok2w@mail.gmail.com>
In-Reply-To: <CAEc3jaBz92QRKCs1Ckb0njDNMu4=CHZcUJ=MPif3Mzvw_Xok2w@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Wed, 4 Jan 2023 12:47:37 -0800
Message-ID: <CAEc3jaD78h1qbWg+QQ40_yv5xc-oGFHAEyEOx2Nh20C-pxwcJg@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Fix division by zero
To:     Alain <alain.carlucci@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, djogorchock@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alain,

Just a brief update. I'm still looking at this and I'm not yet sure
what to do. It looks like there is something wrong with the value
ranges of the gyroscope. I need to dig deep in my memory how this code
came around. Some parts of the sensors code were developed and tested
by a team member, who left. For testing he used some internal test 3D
application in which you center some object. There is some validation
there on the values. However, there is just something strange.

The uncalibrated gyroscope values are 16-bit signed, but the hardware
limits are +/- 2000 degree per second. To have enough precision during
calibration the value range is extended (resolution per axis is set to
1024, so 1024 corresponds to 1 degree per second).

When I heavily shake a DS4 in evtest, I can easily reach values like
15 million or more. However, the maximum value we have set on the
evdev node to about 2M. In other words there is something wrong. I
need to look closely at other internal code.

I really hate this as if true, the DS4 unit tests in hid-tools (and
Android) are broken too.

Thanks,
Roderick

On Fri, Dec 30, 2022 at 1:53 PM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Alain,
>
> Thanks for testing. I added a similar patch to my hid-playstation tree
> this morning (hid-sony will go away soon).
>
> I'm not entirely happy with the patches yet and need to do some
> thinking. The issue is the value range, which is not correct. For the
> accelerometer the numerator and denominator need to be 1 to match the
> proper range. (It just happens that the scaling factors are the way
> they are I think.)
>
> The gyroscope is the issue and I'm not entirely sure what the
> numerator needs to be. If I print the coefficients using one of my
> dualshocks, the ratio of numerator to denominator is around 60. And
> then I'm hunted by some comment from someone in the community..
> https://dsremap.readthedocs.io/en/latest/reverse.html#use-calibration
>
> "Note:
> There=E2=80=99s a 2 factor in the Linux driver, i.e. max_speed and min_sp=
eed
> are added instead of averaged. Either there=E2=80=99s something I don=E2=
=80=99t get,
> or the factor is taken care of in the resolution constant, or it=E2=80=99=
s a
> bug.
> "
>
> I need to do some thinking on whether the current code is right (even
> if it isn't, it can't be changed as it would break software). Then
> what the factor needs to be.
>
> Thanks,
> Roderick
>
> On Fri, Dec 30, 2022 at 10:12 AM Alain <alain.carlucci@gmail.com> wrote:
> >
> > Hi Roderick,
> > Hi Daniel,
> >
> > Thank you for all the suggestions, Roderick.
> > I fixed the typo in your patch, backported to hid-sony and tested both =
of them.
> > They fix the issue and the DS4 can be used even without calibration dat=
a.
> > I cannot test if everything works well with a DualSense because I do no=
t own one.
> >
> > Hi Daniel, I've seen that in the hid-nintendo driver, the calibration d=
enominator is not sanitized if it's zero.
> > If I'm not mistaken, a device that disguises itself as a joycon with de=
nominator zero can crash the kernel
> > when this is used in the mult_frac(). I had this behaviour with the hid=
-sony driver.
> > You can find attached the patch that should solve the problem.
> >
> > Thanks,
> > Alain
> >
> >
> > Il giorno gio 29 dic 2022 alle ore 21:56 Roderick Colenbrander <thunder=
bird2k@gmail.com> ha scritto:
> >>
> >> Hi Alain,
> >>
> >> On Thu, Dec 29, 2022 at 11:21 AM Alain Carlucci
> >> <alain.carlucci@gmail.com> wrote:
> >> >
> >> > Hi Roderick,
> >> >
> >> > >Give this patch a try. It is against hid-playstation, which as of 6=
.2
> >> > >supports DS4. Let me know if it works. You can see the sensors work=
ing
> >> > >through evdev on the motion sensors device.
> >> >
> >> > Thank you for the patch, just tried. I think there is a typo in the
> >> > condition of the for-loop that sanitizes the input.
> >> > Instead of `; i < ARRAY_SIZE()` it's written `; ARRAY_SIZE()`,
> >> > which always evaluates to true. The loop then overflows the array an=
d
> >> > crashes the kernel.
> >>
> >> Ooh oops. It was a quick patch I wrote without testing.
> >>
> >> > By the way, the DualSense code has similar calibration code and also
> >> > there the input is not sanitized.
> >> > I think it's quite easy to create a fake DualSense device with
> >> > an Arduino that emulates the protocol up to calib_denom=3D0, just to
> >> > exploit that and crash every linux machine is plugged in. Or even
> >> > worst, exploit that via bluetooth.
> >>
> >> You are right it probably won't hurt to duplicate the logic there.
> >>
> >> > >If you want to dig deeper, you can play around with
> >> > >dualshock4_get_calibration_data in hid-playstation. The particular
> >> > >report (though not fully documented in the driver) does contain a l=
ot
> >> > >of device info (firmware info, manufacturing dates, various strings=
).
> >> > >You can probably find the details online. Some data there might be
> >> > >weird or not populated.
> >> >
> >> > Thank you! Just discovered that this strange DS4 (CUH-ZCT2E) replies
> >> > all zeros both to HID request 0x02 (get calibration data) and as the
> >> > BT address (request 0x12, Pairing Info), which explains why BT is no=
t
> >> > working.
> >>
> >> There is definitely something weird with your device. Something must
> >> have gotten wiped somehow.
> >>
> >> > I tried to request version info (0xa3), the response seems the same =
as
> >> > another fully-working and original CUH-ZCT2E:
> >> > """
> >> > Build Date: Sep 21 2018 04:50:51
> >> > HW Version: 0100.b008
> >> > SW Version: 00000001.a00a
> >> > SW Series:  2010
> >> > Code Size:  0002a000
> >> > """
> >> >
> >> > Anyway, I have seen that request 0xA2 puts the DS4 in an alternate
> >> > boot mode, probably DFU mode, where the device reboots as 054c:0856
> >> > and waits for data, which seems totally undocumented online.
> >> > Do you know anything about this mode?
> >> > It would be amazing to be able to reflash the original firmware,
> >>
> >> Unfortunately I can't disclose any of that information. I can say that
> >> on DS4 it wasn't common to update firmware (as opposed to DualSense)
> >> while out in the wild. Some of these requests and others are probably
> >> used to initiate firmware programming and programming of MAC address,
> >> calibration data and other settings. It is probably quite involved and
> >> hard to get right without bricking your device.
> >>
> >> > Thanks,
> >> > Alain
> >>
> >> Thanks,
> >> Roderick
