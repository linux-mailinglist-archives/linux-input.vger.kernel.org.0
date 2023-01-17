Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1EA666DF92
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 14:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjAQNzI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Jan 2023 08:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjAQNys (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 08:54:48 -0500
X-Greylist: delayed 161 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 17 Jan 2023 05:54:45 PST
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C829233EF
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 05:54:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673963504; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VISLl0CEoN0NBmA5gO8nOOkJcpRsmpjnjbFeKaD4Ql+cdO3YXXLHIl0Eh6kNEq+9cf
    8CElogUtU/K8jrvMVNzh9Pfpth33cNiVTW+P3Oilqvp05NgpASHaA3C8QVbO0+sZ1VD1
    vu8Vi6zBKV6IDYHvqcz0ypzePAaKMZiYB9W4F0BI+PxWhojFYBF9wXDiw1a15L/7xUEw
    2ZHT2to1xOTbUSGaJOuZyjn2aoDUFnNaEQpCiGuIObTgYG+2hUYzmiRI3tTNlBpM6L7v
    J30+a0V9YqmNSZeGXA0+dHFK3vaItZ0rVZNB6ll69K88jcscC3qTkuErd3CRCbWq02c6
    7qGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1673963504;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZwPwmnzs9X+ESAK/TGlo2iBPgQ+6K8p1lGVo8rQZdAs=;
    b=SOdHvGKgkqcHOXlG8sYkM7EOMiJHpVx1eCXxgzPf5OyEL8LunPJmhXUbsxzTsiqERN
    5fu1bseKQ3FS713+zwppReVdaIDL81OsoBhENH3N05e2d3rNs2balif+DhD9MRGUTyrE
    uHZolYshKwjREQzJu7Q6tnDCgvhb31pKzSBXPzUzG7btth7cRZdTKpZHn8m39LWDKV+M
    Ezk3FepiTL/J80DBfOeKyaH2+E1rbBRw+qqDyIXL/4czjKOfsIYZiCSYP9BGxKtnMVAA
    BbmkK8NyJG5YRNHz3c48QRPDhh5p+Zd7rinABGLEtAtz/7inn+HQhyRKmLCWSrqEIHW4
    jopA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673963504;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=ZwPwmnzs9X+ESAK/TGlo2iBPgQ+6K8p1lGVo8rQZdAs=;
    b=jsBx8wfvph1KumXDEJ5RujdZwz3u7sEDY70bvNJsxObWSJ/safkGTHCICMQuZ0/KOY
    N6IFBqjz2aUcGF7aNPnTSMvACgXyoJttNkuVx9xM1CnopAminpxXalU+yEMI0y1dakn/
    VB0Y6dcFoKcLsd5bMugGBlTfT5vig443WBLUq3crqbNqxLm7tK1ZxiHWY3mf0wsiIgDk
    kQxQJ4DADita/EFhloYXhfNHrF5Fj2HOE6FfczIXCssRZElqorG9wfr5EjA0t15Dtqv4
    QSm8/VQQDk+lxSSAU5OhzwihVi64Xt4sLLe8/OVKMWuw0CGFJoTze27p6KzFTNyTuryO
    3+AA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiH4xfG4rw4kVjaZcB8JtwO"
Received: from [IPV6:2a02:8109:8980:4474:b:cdc4:8c3:7d00]
    by smtp.strato.de (RZmta 48.6.2 AUTH)
    with ESMTPSA id i8cc1ez0HDphHoj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 17 Jan 2023 14:51:43 +0100 (CET)
Message-ID: <aafbda4b-3a1a-cf7d-0a29-ba0b8b4adc4e@xenosoft.de>
Date:   Tue, 17 Jan 2023 14:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice"
To:     Jiri Kosina <jikos@kernel.org>
Cc:     anpatel@nvidia.com, linux-input@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Darren Stevens <darren@stevens-zone.net>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
 <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de>
 <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm>
From:   Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 06 January 2023 at 03:41 pm, Jiri Kosina wrote:
> On Fri, 6 Jan 2023, Christian Zigotzky wrote:
>
>> Hello,
>>
>> The reboot issue is still present in the RC2 of kernel 6.2. We still need the
>> usbhid.patch. [1]
>>
>> Please check the bad commit. [2]
> Ankit,
>
> have you tested with all the devices that you added the quirk for in your
> original patch?
>
> Unless I hear otherwise, I will just drop
> the quirk for USB_DEVICE_ID_CHERRY_MOUSE_000C before this gets clarified.
>
> Thanks,
>
The issue also affects the RC4.

-- Christian
