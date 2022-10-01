Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D217C5F1BE5
	for <lists+linux-input@lfdr.de>; Sat,  1 Oct 2022 12:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiJAKyW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Oct 2022 06:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJAKyV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 1 Oct 2022 06:54:21 -0400
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEB63C8EE
        for <linux-input@vger.kernel.org>; Sat,  1 Oct 2022 03:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1664621658;
        bh=agp9YKsV4q72B6gm5MbJ8Ih1HMZoPviS1D558iLz4OI=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=JIV84VyQ4Hs+hfV+UlK9e65WIVL6C6zB4yGpOReWtLIrBfabaPMmHp1dUSRAhpUGu
         zI3A7dh0TEM4Pf3+PKgICQQGYmrTZ/zGaWUQ/asUiz0qBX2IN9JcxW2Pzw4lbtdzoJ
         7A67VKRasZDdTF2JONlT3NcPCLBGB7qnj58a0XxU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.30.110.10] ([143.244.37.31]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M7b2T-1oZKP11xkL-0081PJ for
 <linux-input@vger.kernel.org>; Sat, 01 Oct 2022 12:54:18 +0200
Message-ID: <3aed5d08-7f55-6c1f-7f61-8b21d3ad61f7@gmx.com>
Date:   Sat, 1 Oct 2022 10:54:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To:     linux-input@vger.kernel.org
From:   "Artem S. Tashkinov" <aros@gmx.com>
Subject: Keyboard LEDs must be reset on resume
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ABZKGbtA62HF2wEvWJBtQWiCLht9yeqmHUjl67UV0R9Pg6hogYW
 wAOIm3T7I8J2hqsMya+7oZ5kWwO7E14z+JlD7oEBXa9TkhshRpr4Fy2a/0iRcbFL66XFKOS
 n/Rd4DzxspXc73hTyxdLwiW6L0jO2sqvneQEpT20cScehEdpQGNr/OsCEgbeqV9Pjs2Gdjp
 h2BIFDE0MXLfS3zlDV7vg==
X-UI-Out-Filterresults: junk:10;V03:K0:bGsNHX25vnI=:UmVd+8ptRb4ZNFBoVSdz1ElS
 DnnyK7uH5zBiMHeYMogzPighn5VUyYiXrVe8uSINeJkP3f9A76P269QgVd5bXmCbz65VpWKu6
 A+FAnlJlohxDBNS3q7g0GwbCXiUHiTbJmTav+zt2aILyR+Tqm1XGMM7NM6otiJRGjC2us0PJX
 c8hBqvf2XspeWx7PqjDVt7flSWmcWvGrcaN9beFBNPYknyUVgtAaMLGWJuesMJYgcptDjQnyc
 X0YB3BFa9bxpWJTNkM3xvAg5//4ekG6q4QwQRrM594nt7pRFPWk824cWuXNpBrJpuH18wgyJH
 Mvu7AqQ4oDzmbHU6vK6GocqwN8dVejupNQQi30B8Oqe6ONz/10XKxekh1nko7elgK0L8Udxp9
 6pdz9RcUvRrr7eTN7zXemM2IMbK+Af/uA6bRk9OdJDBExUH2mi8C2e5D/Y68BAQsFhKeb/nI0
 nuq0FSN+pkvBziL0BX5IF1eHiWnmHev01SREF+VmrntaQx9DMH2EijMGEYH3NPxgnrJpHGhnj
 t4T/lIg2rDDABloHfl5bUaMrJ4UezvKtw1St+zGPvA9FfP5r7P1gGkJhtcFevGrEDr8wZav9c
 djYlAxH212K/X/wAXHuUOpdF3R6rjoiejoHEvAv+y0H3BA4uq2xWIrlH0pcBpM2V2oOl0yosa
 0CSc5HglU+AztojOhRrUYs952F1KoBKgSVqKw4aWDX4mRLjRQN9otBybzc1UfjBm0RPgFFprn
 O0ZUUikyzQT+wmDqcIhnuicqnNUKhcHOEsv4r5w3dKi1XghRemdapceukMPcBA+MlcXxtP/eS
 nsuN9CzqRNzDdovD9FvufmATdxittyWcqg4VyXnDiTupx/JWuz4lOXwj5M5LSrKSSj5BPPIyT
 V9gwKQVDS34Hm3+RCrUAfMRlmOSsg6x+TSorLudwmOqv6fkp+I9SkUbSxLe9wXnAdeZDWnnTq
 Gtta2icHiz8tlgqDqlNbOgsoeoxMW1a2B98E4iO/YX5phorJwvjztJXZ5r7dpBLUSlXcUOLu+
 qtoksbiaulFkGs7jEJD2GHltWrQFywTVhAKJlaXTedqgR5bLtcmKRh4ibldZf2hmVhDnWetU3
 T4DEV6Eun0HwxMbcxaa+CPc+DlrE5ud7sLMDvXFZ4meRjCK2z0sF1BfwdGn95Xj7jRy6Vr12v
 Hc2PX72iOggjGYpdrjAMcD4xOxn9qkDMJM+c8KfuJb8pOQ==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

I have a USB keyboard: ID 046d:c31d Logitech, Inc. Media Keyboard K200

After a suspend/resume cycle all its LEDs are off even though some of
them must be on, e.g. the NUM lock.

Please reset LEDs on resume for USB keyboards, at least this one.

Probably it's worth doing for all keyboards unconditionally.

The respective bug report:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216274

Best regards,
Artem
