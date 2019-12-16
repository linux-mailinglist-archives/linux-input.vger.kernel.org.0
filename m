Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964771211C9
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 18:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfLPRdR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 16 Dec 2019 12:33:17 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:58135 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfLPRdR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 12:33:17 -0500
Received: from [192.168.0.48] ([78.215.252.161]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MLz3X-1iP6F70Sif-00HuMl; Mon, 16 Dec 2019 18:33:12 +0100
Date:   Mon, 16 Dec 2019 17:33:07 +0000
From:   Hamza Attak <hamza@attak.fr>
Subject: Re: hid-logitech-hidpp / hid-logitech-dj driver hiding inputs and
 breaking Logitech G700s buttons
To:     Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc:     Filipe =?iso-8859-1?b?TGHtbnM=?= <lains@archlinux.org>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        linux-input <linux-input@vger.kernel.org>
Message-Id: <1576517587.26677.1@auth.smtp.1and1.fr>
In-Reply-To: <CAN+gG=HP2gW3TTeAapb5p5DfVY3QKFmprFw3NZgJTA9Xi1V3xg@mail.gmail.com>
References: <1576438494.7054.3@auth.smtp.1and1.fr>
        <895e66cf60a022a01701d03d8b873321aebcc30a.camel@archlinux.org>
        <1576458752.26677.0@auth.smtp.1and1.fr>
        <92d802d928be1ce6c4c64394ee5775f56806d064.camel@archlinux.org>
        <CAN+gG=HP2gW3TTeAapb5p5DfVY3QKFmprFw3NZgJTA9Xi1V3xg@mail.gmail.com>
X-Mailer: geary/0.12.4
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:fOiPXch2fOePNgsRGubdT+EEVRG3gPstWkxofEcZgRUKNrc/ueH
 E4ZCrulXC03KBNTQaOSV4h5/HCdnm0rF3OgNpT5b42VKwFA3pZx5JIHKYnIxvaxKOUPqkdo
 D/2fntjvYXv2ImfRWtlaA9XOvEHjt9HUELHTf8t+6+zU/P7JAfSvX3pWx+CuEeKNW0g5A0z
 6UIIvxofoMkQz1nEbDR2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:92aeQNEaJH4=:qPZEEXmzjqSlpXFohzy0VP
 5H4LCVTvDjUbcCsF+Q6IQ9V6t/wst4KtkJQA5dmX76pKo9w91WAXLn1CPc0sZo9o8J1m+JnAF
 bK6f14kFqFCNmny+i3CiXNb5uX7OQDC63knxKJKZWQI1ujt5d5DptPg55CA4fnaKV/YemaNRa
 7dRYUM+S/1HDP2n6cV61nX5aBdNkUj+Jzxbh3gwB/6R0/T/VsYd2LhldTnZfEL6myIbZj1DjH
 NRgdksvYRS/qfyyDWg6E/5Dbq4rClNT6Jl/Pf9e1xPk/isiN5MA6xsNMM3/VphDV7cjoT2xb9
 bZbFU5VcVvta006F+OuOHtLWpOSMAV1I526t/TtLd+tmtSTQ4SzcCY8Jk+SpuzlSPvootRjLM
 dj33XaVCTgvZG/jobunC0XPTl2F0UR/2N1AzO/6sQeARnVE4Be9ztKe8rOBqf8o8spj6uNxct
 HchEQEyKutCCX9XLWR+kULHBbUzXvc6R78Ex7uLPGRKzOOX8KGGHE7xpMQEgCk91kMTik+rFD
 RcSQyTNr7C8hrS4t/diVEKenN/112tXldul6qXAx1cO6NY2DNIkORgLaStlJp9jRr1FgoAXVD
 LgfilZ2Bu2jp49KOv2N0FKBn4wnFpC324zX0UX1+xn9gtp1FdN7VN1JChVq7gb6vf29sSP9dQ
 MKPKm+ofqka6n4kSR6gXRr0TCWuPCLmAh+lMNqd7FOYD0ZvyuA1W/EWAPTHaWN/JectzUsyPl
 CA31DQtQqPy4z2MPZdkd5wnYmPc4oBkPJ+U5MMZASGno4QyDxGST3Txpogu1GQuo6k9rsw2A9
 WxrGksgrxwTdSxZaQOyrWoqvD5iHTrE/kk+wRXsfACEoAsti9jT8U2jd3Qyf4FkJ0iyXa/R3o
 aLhgXwGUhMAEFHweBXpg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Yes I have macros on these buttons, most of them are the ones 
pre-recorded from
the Logitech Windows software (Previous, Forward, Ctrl+Tab, 
Ctrl+Shift+Tab). I
also have two custom ones which are Ctrl+W and Ctrl+T, respectively on 
G9 and
G10.

I do have an input recorded on hid-recorder. Thank you for the link.
Please find below the isolated output for each of the problematic 
buttons:

g06_ctrl_alt_tab.txt
	# ReportID: 16 /Vendor Defined Page 1 ['01', '41', '07', '12', '2a', 
'10']
	E: 000229.982728 7 10 01 41 07 12 2a 10
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000229.985686 9 02 00 00 00 00 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '00', '10', '00', 
'00']
	E: 000229.993657 7 10 01 81 00 10 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '80', '00', '00', '00', 
'00']
	E: 000230.005685 7 10 01 80 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '07', '01', '00', 
'00']
	E: 000230.017710 7 10 01 81 07 01 00 00
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000230.170755 9 02 00 00 00 00 00 00 00 00

g07_ctrl_tab.txt
	# ReportID: 16 /Vendor Defined Page 1 ['01', '41', '07', '12', '2a', 
'10']
	E: 000204.737718 7 10 01 41 07 12 2a 10
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000204.740705 9 02 00 00 00 00 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '00', '10', '00', 
'00']
	E: 000204.748724 7 10 01 81 00 10 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '80', '00', '00', '00', 
'00']
	E: 000204.760914 7 10 01 80 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '07', '01', '00', 
'00']
	E: 000204.772824 7 10 01 81 07 01 00 00
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000204.907710 9 02 00 00 00 00 00 00 00 00

g08_battery_level.txt (on-mice LED display only)
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000635.415154 9 02 00 00 00 00 00 00 00 00
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000635.718188 9 02 00 00 00 00 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '07', '01', '00', 
'00']
	E: 000635.970283 7 10 01 81 07 01 00 00

g09_ctrl_w.txt
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000162.848869 9 02 00 00 00 00 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '41', '07', '12', '2a', 
'10']
	E: 000162.858891 7 10 01 41 07 12 2a 10
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '00', '10', '00', 
'00']
	E: 000162.875925 7 10 01 81 00 10 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '80', '00', '00', '00', 
'00']
	E: 000162.887846 7 10 01 80 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '07', '01', '00', 
'00']
	E: 000162.899826 7 10 01 81 07 01 00 00
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000163.100815 9 02 00 00 00 00 00 00 00 00

g10_ctrl_t.txt
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000046.352043 9 02 00 00 00 00 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '41', '07', '12', '2a', 
'10']
	E: 000046.364976 7 10 01 41 07 12 2a 10
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '00', '10', '00', 
'00']
	E: 000046.381939 7 10 01 81 00 10 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '80', '00', '00', '00', 
'00']
	E: 000046.394148 7 10 01 80 00 00 00 00
	# ReportID: 16 /Vendor Defined Page 1 ['01', '81', '07', '01', '00', 
'00']
	E: 000046.406072 7 10 01 81 07 01 00 00
	# ReportID: 2 / Button: 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	| X: 0 | Y: 0 | Wheel: 0 | AC Pan: 0
	E: 000046.600971 9 02 00 00 00 00 00 00 00 00

For info, all the mouse functionalities seems to work fine with bare 
usbhid
driver and upower picking up the battery level, is there a feature 
added or a
specific reason to use Logitech drivers?

Thanks,
Hamza.


On Mon, 16 Dec, 2019 at 3:41 PM, Benjamin Tissoires 
<benjamin.tissoires@gmail.com> wrote:
> On Mon, Dec 16, 2019 at 2:48 AM Filipe Laíns <lains@archlinux.org> 
> wrote:
>> 
>>  On Mon, 2019-12-16 at 01:12 +0000, Hamza Attak wrote:
>>  > Hi Filipe,
>>  >
>>  > I'm on the latest 5.4.3 from kernel from kernel.org git 
>> repository. Only
>>  > a few security options are tweaked in the kconfig.
>>  > For your information, I am also facing the same issue on untouched
>>  > Ubuntu
>>  > built kernels,
>>  >
>>  > I never followed linux-input before and don't know how active was 
>> the
>>  > code
>>  > taking care of the G700s, but do you think there might have been a
>>  > regression
>>  > since you say that it was a fixed issue?
>>  >
>>  > Unfortunately, I didn't keep track on when it happened, ie after a
>>  > kernel
>>  > upgrade or if it was always there and I only noticed after trying 
>> the
>>  > mouse
>>  > wirelessly.
>>  >
>>  > Thanks,
>>  > Hamza ATTAK.
>>  >
>> 
>>  Okay. Do the logs show anything interesting?
>> 
>>  I don't have the mouse but I think Benjamin does. Let's see if he 
>> knows
>>  what's going on.
> 
> Hmm, I just gave a test on the G700 (not s) that I have, and  in both
> cases (wired or not), I can see the incoming button events *when they
> are mapped to something meaningful*.
> 
> FYI, 0xC531 wireless receiver has been added in v5.4, so that is when
> you must have seen your problem appearing.
> 
> So:
> - have you mapped any special buttons/macros to those buttons 
> (G6-G10)?
> - can we get the output of hid-recorder[1] so see what the mouse
> actually sends (both in wired or wireless mode)?
> 
> Cheers,
> Benjamin
> 
> [1] https://gitlab.freedesktop.org/libevdev/hid-tools

