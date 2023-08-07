Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3501771BDE
	for <lists+linux-input@lfdr.de>; Mon,  7 Aug 2023 09:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjHGHyY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Aug 2023 03:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjHGHyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Aug 2023 03:54:06 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BA11737
        for <linux-input@vger.kernel.org>; Mon,  7 Aug 2023 00:53:36 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qSv3W-00019d-4r; Mon, 07 Aug 2023 09:53:34 +0200
Message-ID: <a65bd290-52d5-475c-0234-85759c5892a2@leemhuis.info>
Date:   Mon, 7 Aug 2023 09:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: atkbd input regression
Content-Language: en-US, de-DE
To:     =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= 
        <koalinux@gmail.com>, linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691394816;82759820;
X-HE-SMSGID: 1qSv3W-00019d-4r
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_PASS,T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

Hi, Thorsten here, the Linux kernel's regression tracker.

On 07.08.23 07:19, José Ramón Muñoz Pekkarinen wrote:
>     Sorry again, now in plaintext mode.
> 
>     Hi,
> 
>     I'd like to seek help or advise in a possible
> regression that I detected on my system(a
> Thinkpad L14 Gen 1) that concerns the atkbd
> module. My OS is a gentoo, with self built
> kernels, and a plasma desktop environment
> using wayland. Up to the kernel 5.16.x my
> builtin keyboard worked(and works still)
> fine both in tty and the plasma session, but
> from that kernel on, the keyboard works only
> in tty, and no longer in the plasma session.

Could you try bisecting this? A few howtos on the net describe what to
do. Be sure to use the configuration for your working 5.16 kernel for
any builds of newer versions (ideally put it <somewhere> and run "cp
<somewhere> .config; make oldconfig" every time before building a newer
kernel.

Ciao, Thorsten

>     The input config section of my 5.16.17 kernel:
> 
> #
> # Input device support
> #
> CONFIG_INPUT=y
> CONFIG_INPUT_LEDS=m
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
> 
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=m
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> CONFIG_INPUT_JOYDEV=m
> CONFIG_INPUT_EVDEV=m
> # CONFIG_INPUT_EVBUG is not set
> 
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_APPLESPI is not set
> CONFIG_KEYBOARD_ATKBD=y
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> 
>     And the same for 6.4.7:
> 
> #
> # Input device support
> #
> CONFIG_INPUT=y
> CONFIG_INPUT_LEDS=m
> # CONFIG_INPUT_FF_MEMLESS is not set
> # CONFIG_INPUT_SPARSEKMAP is not set
> # CONFIG_INPUT_MATRIXKMAP is not set
> CONFIG_INPUT_VIVALDIFMAP=y
> 
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=m
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> CONFIG_INPUT_JOYDEV=m
> CONFIG_INPUT_EVDEV=m
> # CONFIG_INPUT_EVBUG is not set
> 
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_APPLESPI is not set
> CONFIG_KEYBOARD_ATKBD=y
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_PINEPHONE is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> 
>     If I run evtest, the keyboard is detected, and I can
> retrieve its events. From my kernel 6.4, this is an
> example of it's output.
> 
> # evtest
> No device specified, trying to scan all of /dev/input/event*
> Available devices:
> /dev/input/event0:      AT Translated Set 2 keyboard
> /dev/input/event1:      Power Button
> /dev/input/event10:     SEM HCT Keyboard Consumer Control
> /dev/input/event11:     SEM HCT Keyboard System Control
> /dev/input/event12:     Logitech USB Optical Mouse
> /dev/input/event2:      Lid Switch
> /dev/input/event3:      Sleep Button
> /dev/input/event4:      Power Button
> /dev/input/event5:      Video Bus
> /dev/input/event6:      ThinkPad Extra Buttons
> /dev/input/event7:      SynPS/2 Synaptics TouchPad
> /dev/input/event8:      TPPS/2 Elan TrackPoint
> /dev/input/event9:      SEM HCT Keyboard
> Select the device event number [0-12]: 0
> Input driver version is 1.0.1
> Input device ID: bus 0x11 vendor 0x1 product 0x1 version 0xab54
> Input device name: "AT Translated Set 2 keyboard"
> Supported events:
>  Event type 0 (EV_SYN)
>  Event type 1 (EV_KEY)
>    Event code 1 (KEY_ESC)
>    Event code 2 (KEY_1)
>    Event code 3 (KEY_2)
>    Event code 4 (KEY_3)
>    Event code 5 (KEY_4)
>    Event code 6 (KEY_5)
>    Event code 7 (KEY_6)
>    Event code 8 (KEY_7)
>    Event code 9 (KEY_8)
>    Event code 10 (KEY_9)
>    Event code 11 (KEY_0)
>    Event code 12 (KEY_MINUS)
>    Event code 13 (KEY_EQUAL)
>    Event code 14 (KEY_BACKSPACE)
>    Event code 15 (KEY_TAB)
>    Event code 16 (KEY_Q)
>    Event code 17 (KEY_W)
>    Event code 18 (KEY_E)
>    Event code 19 (KEY_R)
>    Event code 20 (KEY_T)
>    Event code 21 (KEY_Y)
>    Event code 22 (KEY_U)
>    Event code 23 (KEY_I)
>    Event code 24 (KEY_O)
>    Event code 25 (KEY_P)
>    Event code 26 (KEY_LEFTBRACE)
>    Event code 27 (KEY_RIGHTBRACE)
>    Event code 28 (KEY_ENTER)
>    Event code 29 (KEY_LEFTCTRL)
>    Event code 30 (KEY_A)
>    Event code 31 (KEY_S)
>    Event code 32 (KEY_D)
>    Event code 33 (KEY_F)
>    Event code 34 (KEY_G)
>    Event code 35 (KEY_H)
>    Event code 36 (KEY_J)
>    Event code 37 (KEY_K)
>    Event code 38 (KEY_L)
>    Event code 39 (KEY_SEMICOLON)
>    Event code 40 (KEY_APOSTROPHE)
>    Event code 41 (KEY_GRAVE)
>    Event code 42 (KEY_LEFTSHIFT)
>    Event code 43 (KEY_BACKSLASH)
>    Event code 44 (KEY_Z)
>    Event code 45 (KEY_X)
>    Event code 46 (KEY_C)
>    Event code 47 (KEY_V)
>    Event code 48 (KEY_B)
>    Event code 49 (KEY_N)
>    Event code 50 (KEY_M)
>    Event code 51 (KEY_COMMA)
>    Event code 52 (KEY_DOT)
>    Event code 53 (KEY_SLASH)
>    Event code 54 (KEY_RIGHTSHIFT)
>    Event code 55 (KEY_KPASTERISK)
>    Event code 56 (KEY_LEFTALT)
>    Event code 57 (KEY_SPACE)
>    Event code 58 (KEY_CAPSLOCK)
>    Event code 59 (KEY_F1)
>    Event code 60 (KEY_F2)
>    Event code 61 (KEY_F3)
>    Event code 62 (KEY_F4)
>    Event code 63 (KEY_F5)
>    Event code 64 (KEY_F6)
>    Event code 65 (KEY_F7)
>    Event code 66 (KEY_F8)
>    Event code 67 (KEY_F9)
>    Event code 68 (KEY_F10)
>    Event code 69 (KEY_NUMLOCK)
>    Event code 70 (KEY_SCROLLLOCK)
>    Event code 71 (KEY_KP7)
>    Event code 72 (KEY_KP8)
>    Event code 73 (KEY_KP9)
>    Event code 74 (KEY_KPMINUS)
>    Event code 75 (KEY_KP4)
>    Event code 76 (KEY_KP5)
>    Event code 77 (KEY_KP6)
>    Event code 78 (KEY_KPPLUS)
>    Event code 79 (KEY_KP1)
>    Event code 80 (KEY_KP2)
>    Event code 81 (KEY_KP3)
>    Event code 82 (KEY_KP0)
>    Event code 83 (KEY_KPDOT)
>    Event code 85 (KEY_ZENKAKUHANKAKU)
>    Event code 86 (KEY_102ND)
>    Event code 87 (KEY_F11)
>    Event code 88 (KEY_F12)
>    Event code 89 (KEY_RO)
>    Event code 90 (KEY_KATAKANA)
>    Event code 91 (KEY_HIRAGANA)
>    Event code 92 (KEY_HENKAN)
>    Event code 93 (KEY_KATAKANAHIRAGANA)
>    Event code 94 (KEY_MUHENKAN)
>    Event code 95 (KEY_KPJPCOMMA)
>    Event code 96 (KEY_KPENTER)
>    Event code 97 (KEY_RIGHTCTRL)
>    Event code 98 (KEY_KPSLASH)
>    Event code 99 (KEY_SYSRQ)
>    Event code 100 (KEY_RIGHTALT)
>    Event code 102 (KEY_HOME)
>    Event code 103 (KEY_UP)
>    Event code 104 (KEY_PAGEUP)
>    Event code 105 (KEY_LEFT)
>    Event code 106 (KEY_RIGHT)
>    Event code 107 (KEY_END)
>    Event code 108 (KEY_DOWN)
>    Event code 109 (KEY_PAGEDOWN)
>    Event code 110 (KEY_INSERT)
>    Event code 111 (KEY_DELETE)
>    Event code 112 (KEY_MACRO)
>    Event code 113 (KEY_MUTE)
>    Event code 114 (KEY_VOLUMEDOWN)
>    Event code 115 (KEY_VOLUMEUP)
>    Event code 116 (KEY_POWER)
>    Event code 117 (KEY_KPEQUAL)
>    Event code 118 (KEY_KPPLUSMINUS)
>    Event code 119 (KEY_PAUSE)
>    Event code 121 (KEY_KPCOMMA)
>    Event code 122 (KEY_HANGUEL)
>    Event code 123 (KEY_HANJA)
>    Event code 124 (KEY_YEN)
>    Event code 125 (KEY_LEFTMETA)
>    Event code 126 (KEY_RIGHTMETA)
>    Event code 127 (KEY_COMPOSE)
>    Event code 128 (KEY_STOP)
>    Event code 140 (KEY_CALC)
>    Event code 142 (KEY_SLEEP)
>    Event code 143 (KEY_WAKEUP)
>    Event code 155 (KEY_MAIL)
>    Event code 156 (KEY_BOOKMARKS)
>    Event code 157 (KEY_COMPUTER)
>    Event code 158 (KEY_BACK)
>    Event code 159 (KEY_FORWARD)
>    Event code 163 (KEY_NEXTSONG)
>    Event code 164 (KEY_PLAYPAUSE)
>    Event code 165 (KEY_PREVIOUSSONG)
>    Event code 166 (KEY_STOPCD)
>    Event code 172 (KEY_HOMEPAGE)
>    Event code 173 (KEY_REFRESH)
>    Event code 183 (KEY_F13)
>    Event code 184 (KEY_F14)
>    Event code 185 (KEY_F15)
>    Event code 217 (KEY_SEARCH)
>    Event code 226 (KEY_MEDIA)
>  Event type 4 (EV_MSC)
>    Event code 4 (MSC_SCAN)
>  Event type 17 (EV_LED)
>    Event code 0 (LED_NUML) state 0
>    Event code 1 (LED_CAPSL) state 0
>    Event code 2 (LED_SCROLLL) state 0
> Key repeat handling:
>  Repeat type 20 (EV_REP)
>    Repeat code 0 (REP_DELAY)
>      Value    250
>    Repeat code 1 (REP_PERIOD)
>      Value     33
> Properties:
> Testing ... (interrupt to exit)
> Event: time 1691384520.078772, type 4 (EV_MSC), code 4 (MSC_SCAN), value 10
> Event: time 1691384520.078772, type 1 (EV_KEY), code 16 (KEY_Q), value 1
> Event: time 1691384520.078772, -------------- SYN_REPORT ------------
> Event: time 1691384520.157298, type 4 (EV_MSC), code 4 (MSC_SCAN), value 10
> Event: time 1691384520.157298, type 1 (EV_KEY), code 16 (KEY_Q), value 0
> Event: time 1691384520.157298, -------------- SYN_REPORT ------------
> Event: time 1691384520.849991, type 4 (EV_MSC), code 4 (MSC_SCAN), value 11
> Event: time 1691384520.849991, type 1 (EV_KEY), code 17 (KEY_W), value 1
> Event: time 1691384520.849991, -------------- SYN_REPORT ------------
> Event: time 1691384520.919630, type 4 (EV_MSC), code 4 (MSC_SCAN), value 11
> Event: time 1691384520.919630, type 1 (EV_KEY), code 17 (KEY_W), value 0
> Event: time 1691384520.919630, -------------- SYN_REPORT ------------
> Event: time 1691384521.311986, type 4 (EV_MSC), code 4 (MSC_SCAN), value 12
> Event: time 1691384521.311986, type 1 (EV_KEY), code 18 (KEY_E), value 1
> Event: time 1691384521.311986, -------------- SYN_REPORT ------------
> Event: time 1691384521.417578, type 4 (EV_MSC), code 4 (MSC_SCAN), value 12
> Event: time 1691384521.417578, type 1 (EV_KEY), code 18 (KEY_E), value 0
> Event: time 1691384521.417578, -------------- SYN_REPORT ------------
> Event: time 1691384521.639505, type 4 (EV_MSC), code 4 (MSC_SCAN), value 13
> Event: time 1691384521.639505, type 1 (EV_KEY), code 19 (KEY_R), value 1
> Event: time 1691384521.639505, -------------- SYN_REPORT ------------
> Event: time 1691384521.709170, type 4 (EV_MSC), code 4 (MSC_SCAN), value 13
> Event: time 1691384521.709170, type 1 (EV_KEY), code 19 (KEY_R), value 0
> Event: time 1691384521.709170, -------------- SYN_REPORT ------------
> Event: time 1691384521.879657, type 4 (EV_MSC), code 4 (MSC_SCAN), value 14
> Event: time 1691384521.879657, type 1 (EV_KEY), code 20 (KEY_T), value 1
> Event: time 1691384521.879657, -------------- SYN_REPORT ------------
> Event: time 1691384521.958384, type 4 (EV_MSC), code 4 (MSC_SCAN), value 14
> Event: time 1691384521.958384, type 1 (EV_KEY), code 20 (KEY_T), value 0
> Event: time 1691384521.958384, -------------- SYN_REPORT ------------
> Event: time 1691384522.188556, type 4 (EV_MSC), code 4 (MSC_SCAN), value 15
> Event: time 1691384522.188556, type 1 (EV_KEY), code 21 (KEY_Y), value 1
> 
>     I have reported this time ago in libinput, and they
> replied it might be a kernel problem, since booting
> my kernel 5.16 makes it work correctly again anytime.
> 
>    Could anyone please shed some light on this little
> problem?
> 
>    Best regards.
> 
>    José Pekkarinen
