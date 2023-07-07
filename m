Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90E574B8A1
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 23:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbjGGVXF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 17:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGGVXE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 17:23:04 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86D81FD8
        for <linux-input@vger.kernel.org>; Fri,  7 Jul 2023 14:23:00 -0700 (PDT)
Received: from [192.168.178.22] ([88.217.88.42]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVe1U-1qRtLT0QKa-00RVlT for <linux-input@vger.kernel.org>; Fri, 07 Jul 2023
 23:22:59 +0200
Message-ID: <f26c2aab-7c89-d6e4-b8c1-f6740e08b034@rdorf.de>
Date:   Fri, 7 Jul 2023 23:22:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Need information to implement correct handling of the GSP 370
 wireless headset
Content-Language: de-DE, en-US
From:   Werner Sembach <werner@rdorf.de>
To:     linux-input@vger.kernel.org
References: <e01dbcd2-3ce3-ebaf-e685-3b89601ae55a@rdorf.de>
In-Reply-To: <e01dbcd2-3ce3-ebaf-e685-3b89601ae55a@rdorf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:MVZqFF6mJvljR7VJ7foBP9NFu7IsFLz+wBdBBBrrW7jC5RN1Ech
 O2UMXnNfP3U90t74EYNyeN38eX5IcpmH0oNigC53nElvbbgSFBFhlVw+LLcbaeavJZ146KM
 BC+wHuJ1ok6Ygui4paP1g26xPxGDM2d8cDoGYW7dmcSRMu387syX0byuk18ZcUStckYnEg2
 qQP+pMQqMPY3UFrNIC66w==
UI-OutboundReport: notjunk:1;M01:P0:Y43afuu+6oY=;O/IpGHVbn03o1vbYb0PcYA65/SE
 EWY5XNS6+45qsPmiwDm+/VpSshduoDQLH39bIo/jUNcISt/Dm9lLtGDr8eT3IYPe9Av0l2bor
 ThetOZ8hHT+aa3PZnw3j9eflpOQu0S0dqmwRQLffSs4hIcblwM6rOVsVVo3njpRHfpowVaNyG
 eLSUnFCxwMNvxTa8S1hoeoU7c4/gRo9L+lKM8MVljE5GzGUc8RB9ZKBKu53K3KB2pxpXZlxWU
 mGnLCfUdUb3Lr00CfWyntnLJxq7iLW8dkUMnj1/REwnSV227/lntPlN7BHT0J7TCDR/YZlmhL
 Y9P/XFluaXGhoBjMX7Cnhw4Rxd95avow5W7cnVZ67lEJKaZ9tKFGdK3AaTbJOFMaosemlo245
 p/WgJKMS+1JLo6CwsjT36KlgcrvbGudwZK8ENVVCl1keR/IFwGmjXFF+1NMhSOtNL8jDlGknA
 7shxP+4M2DOeOZzaC1ryqmQA0Sx99/Lh1+ZW5WiXIvepVVm6SfV2pnT1DyvyWQkKOiCNUluYT
 hDBhIPyp71d2UXxCWTCUkKSIOMfsJK7f+M2Q7EsR4TLESSxvcBz2y3JaAx2ETUO0Plld+/dvo
 qSzxonr9zHl1uIyzOo9P0yqNDn7jqoUKQvRfu/JbeiRUlCg/+ELHksjl1gUMYPUhkWq0Jtnxu
 4tETUtD9a8/4zkKhDXfh4FsOX8Jp4sT6ipYiSNpG3A==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am 07.07.23 um 23:12 schrieb Werner Sembach:
> Hi,
>
> The EPOS GSP 370 wireless headset has a volume control knob on the 
> headset. Turning this has 2 effects on Linux:
>
> - The volume gets adjusted in firmware
>
> - A volume up/down key event is sent to the OS and the volume is 
> adjustet on the OS level (the dongle registers both as a audio device 
> and an usb keyboard to do this)
>
> This double volume adjust is ofc not the intended behavior and induces 
> all kinds of wiredness, like the os is already displaying 100% volume 
> but you can still turn it higher because the firmware has not yet 
> reached max volume.
>
> Running Wireshark on Windows and Linux I recognized that Windows is 
> sending "URB_CONTROL out" events to the dongle on volume adjust, which 
> Linux doesn't, these events have a paylode that seems to encode a 
> volume value in 2 byte with little endianess.
>
> I'm unsure if I can attach pcap file or if it will get blocked in the 
> list so i will send them as a reply.
As I thought: The pcapng files are to big for the mailing list. When 
someone is interested let me know how I can send them (should I open a 
Bugzilla Ticket for it?).
>
> So my 2 questions are:
>
> - What are these USB "URB_CONTROL out" events? (Does not seem to be 
> HID reports?)
>
> - In which subsystem would I want to implement them? Or should this be 
> handled in userspace?
>
> Bast regards,
>
> Werner
>
