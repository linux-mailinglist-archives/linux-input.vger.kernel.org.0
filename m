Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD13311FC7A
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 02:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfLPBMh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sun, 15 Dec 2019 20:12:37 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:56151 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfLPBMh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Dec 2019 20:12:37 -0500
Received: from [192.168.0.48] ([78.215.252.161]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MHnZQ-1iRpVU0fR8-00EvLA; Mon, 16 Dec 2019 02:12:34 +0100
Date:   Mon, 16 Dec 2019 01:12:32 +0000
From:   Hamza Attak <hamza@attak.fr>
Subject: Re: hid-logitech-hidpp / hid-logitech-dj driver hiding inputs and
 breaking Logitech G700s buttons
To:     Filipe =?iso-8859-1?b?TGHtbnM=?= <lains@archlinux.org>
Cc:     nlopezcasad@logitech.com, benjamin.tissoires@gmail.com,
        linux-input@vger.kernel.org
Message-Id: <1576458752.26677.0@auth.smtp.1and1.fr>
In-Reply-To: <895e66cf60a022a01701d03d8b873321aebcc30a.camel@archlinux.org>
References: <1576438494.7054.3@auth.smtp.1and1.fr>
        <895e66cf60a022a01701d03d8b873321aebcc30a.camel@archlinux.org>
X-Mailer: geary/0.12.4
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:TGqAwWhQzAXTVrYRkinhWcxIGspzeVZ/rb4ijcxsYlXvNj3/M83
 Q0auSJPCIHPH+EKsSI8Su1PSkUGy2wGURjhkeOLUARBGGPVHZQ3SLiX7BgaG70VUNE05I+1
 oMdMGgYTHezNSa+r3kDOPcrYEG5Nek6YBOeG0cdDem6TSWior818zg9EInp6xCHwoBjVNHv
 BKkJfsmYl4MI3GPTjP2Hg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a/PqywyIsVQ=:VxPoBp+kQOFUFQcZVkeaJC
 UpuVW9Tk4pZPd25u6phvACteRxZTf+r2O53MSNXdP2FkNJhmUnrfIFp1xgPQfP3Z45j1oe8QR
 /lPb7Hwnvd2BnJ59yP/qWvfVKlUNadn9OsgldJpQBerILQQ4mZ3AOkxLGH0dcTglXxc+XgVX4
 m0AL2uINdD+skxtrrVHWpG6OHhAC9IPr+eE42irS3sFsNtdeHrpFbYXIeGqOo/WEAKslpwjm8
 28UB9V063jNbDJ2Rjb1D01ddiDD093e/qDfPak+7UUNgG+5RZJqjGDJyxZq9Lzl+9YTJy83Vp
 GzLUaHa0hZlzpnhiJaroCTgo8hDYnWFqFXLPVZyBCYTJ63yNbUxTFkrySwLJLxnusHg2PlJ2D
 ez9SWkTokskubc3K8oO5i/2g+DCd19mamrDNaDp1obi1SzY8pHHb7u1GuzieN+ES5JNPGN9XO
 iWJsFLRW2xYXSYDYHz6IVq7VnKkxHyzlVthe0jg9Uq0Y672yPb/geUM7oonvVoshExpGjWhlu
 OC764aRXdDUbeZ5neh/V2R4z/8P7i3ZJbxjQDGTV9X/8/4YxhY1v5JkFzLUsP61gaDXq0aqn+
 wcZKnKpNz2/6AKeoW5JGuqbDrgDjXyeub6hjAV4lOa3mA7NoiYP1a0B6oqW2PNPnoSFZ897XO
 X9J2F8HXf5d0NsWi41eTOkvA1VFcR66GyV0mgE2sOz7Yxmj96jlPkgSvfZAzvqNTSI8DJVKtv
 ZJon8Mq6Q0PhtN9z0Yo5gjeL1DW3meCWdUi5NU3kQfP2VrLvLfC8J0WhCp7lYmb6qQsGudc0p
 Mo7WX6aMyIBeg/f8VCOUmmOG+bMK6vA187Dax4UraRM7NTTHEyrvw0TKCF3jvXr4SS+qiKLuo
 ssmzrjntCOKi1IvGlJFA==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Filipe,

I'm on the latest 5.4.3 from kernel from kernel.org git repository. Only
a few security options are tweaked in the kconfig.
For your information, I am also facing the same issue on untouched 
Ubuntu
built kernels,

I never followed linux-input before and don't know how active was the 
code
taking care of the G700s, but do you think there might have been a 
regression
since you say that it was a fixed issue?

Unfortunately, I didn't keep track on when it happened, ie after a 
kernel
upgrade or if it was always there and I only noticed after trying the 
mouse
wirelessly.

Thanks,
Hamza ATTAK.


On Mon, 16 Dec, 2019 at 12:49 AM, Filipe Laíns <lains@archlinux.org> 
wrote:
> On Sun, 2019-12-15 at 19:34 +0000, Hamza Attak wrote:
>>  Hi,
>> 
>>  I have been facing an issue with my Logitech G700s mouse on wireless
>>  (id of
>>  the receiver is 046d:c531).
>>  Most of the buttons are not working, namely:
>>   G6, G7, G8, G9, G10
>> 
>>  My testing has shown that when pressing these buttons, no input at
>>  all
>>  is
>>  showing on both interfaces:
>>   /dev/input/by-id/usb-Logitech_USB_Receiver-if01-event-mouse
>>   /dev/input/by-id/usb-Logitech_USB_Receiver-if01-mouse
>> 
>>  Further testing shown that having 'hid_logitech_dj' or
>>  'hid_logitech_hidpp'
>>  module loaded is causing the issue, just one of them loaded is
>>  enough
>>  to create
>>  the issue. This led me to contact you by looking at
>>  'drivers/hid/hid-logitech-dj.c' and 'drivers/hid/hid-logitech-
>>  hidpp.c').
>>  rmmod'ing the modules and using 'usbhid' module alone is solving the
>>  issue, as
>>  Linux is now receiving correct input from the buttons.
>> 
>>  Blacklisting the modules would do the trick for wireless on my local
>>  system, but
>>  it doesn't seem right no to report this bug for others.
>> 
>>  For info, it works perfectly wired, so I guess the issue might be
>>  with
>>  the dj
>>  receiver code.
>> 
>>  Before thinking of modifying the code myself, I am sending you this
>>  message and
>>  see what would be a clean fix for the issue.
>> 
>>  Thanks,
>>  Hamza ATTAK.
>> 
> 
> Hello Hamza,
> 
> Which kernel version are you using? I am pretty sure this is an issue
> that was fixed in newer versions.
> 
> Thank you,
> Filipe Laíns

