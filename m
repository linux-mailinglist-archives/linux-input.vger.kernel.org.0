Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02031E1A99
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 07:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgEZFMU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 May 2020 01:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgEZFMU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 May 2020 01:12:20 -0400
Received: from mail.tambre.ee (mail.tambre.ee [IPv6:2a01:7e01:e001:cc::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B88FEC061A0E
        for <linux-input@vger.kernel.org>; Mon, 25 May 2020 22:12:19 -0700 (PDT)
Received: from [172.16.1.46] (unknown [194.204.61.131])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: raul)
        by mail.tambre.ee (Postfix) with ESMTPSA id E0E687D51A;
        Tue, 26 May 2020 08:12:17 +0300 (EEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.tambre.ee E0E687D51A
Authentication-Results: mail.tambre.ee; dmarc=fail (p=reject dis=none) header.from=tambre.ee
Authentication-Results: mail.tambre.ee; spf=fail smtp.mailfrom=raul@tambre.ee
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tambre.ee E0E687D51A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tambre.ee; s=201812;
        t=1590469938; bh=lW4weOtIwMD2nrivtphKRgAyNYaEaq5WLJkJWJvUUOw=;
        h=Subject:From:To:References:Cc:Date:In-Reply-To:From;
        b=E6L+CRMj00igyT0G368fFXPR4/rxfL4YBhfdNQQ4Ot/DT1KYGT0DYX4Pf5dxR4rSh
         acnU8AkFaPR0OLn3/Nk7qAPyxLqgZPzyeVqqyeeD6oA4E5gFyAyND+UEnF2cTRbPS+
         rlslQtiHFPS7EWC1B4BD0dAlivBZIZ6lqg+KdX2JdqoKG+fCFbZhV30gGzeF6320SS
         d2RFJ4VucqPoNXS2jjhu0t31cktyMyemi52OuXuiA8EpxWdhgwX/S5QmDqlq8WEDes
         vLX87kU8cPhDuTE1fTeQtBdUVhfTz597wrsspXvypVSH6I88PUI52Bp33NuC7PwC3Y
         +m7f/ul5J2pPw==
Subject: Re: PROBLEM: Logitech G29 driving wheel input events are garbage if
 device is opened too soon after plugging in
From:   Raul Tambre <raul@tambre.ee>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
References: <c9b4a054-a592-f225-3229-64c21297467c@tambre.ee>
Cc:     linux-input@vger.kernel.org
Message-ID: <d336df64-4054-449c-0ffa-1573d021b41b@tambre.ee>
Date:   Tue, 26 May 2020 08:12:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <c9b4a054-a592-f225-3229-64c21297467c@tambre.ee>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Re-sending due to a technical issue resulting in the email being 
rejected by the mailing list.

On 25/05/2020 16:19, Raul Tambre wrote:
>
> When Logitech's "G29 Driving Force Racing Wheel" is plugged in and a 
> program opens it too quickly after that (<120ms), then writing an 
> autocenter effect returns EINVAL and values for input events are garbage.
>
> *Example*
> I've attached a C program that helps reproduce the issue.
> It detects the wheel being plugged in using inotify and applies an 
> autocenter effect. It also prints out input events.
>
> The default device the example opens is /dev/steering_wheel. The 
> device name can be changed in the WHEEL_DEVICE define.
> Add an udev rule to make the steering wheel appear with a fixed name 
> under /dev, e.g.:
> SUBSYSTEM=="input", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c24f", 
> SYMLINK+="steering_wheel"
>
> Steps:
> 1. Connect the wheel.
> 2. Run the program. An autocenter force should be applied.
> 3. Remove the wheel's USB cable from your computer. You should see 
> "wheel disconnected".
> 4. Plug it back in. The wheel should start its homing sequence.
> 5. The write() in write_autocenter() should fail with EINVAL and the 
> printed input events should be garbage.
>
> *Workaround*
> Sleeping before opening the device after it is reconnected avoids the 
> problem. This can be done through the SLEEP_MS define in the example.
> A value higher than roughly 120ms avoids the issue on my machine.
>
> *Input events*
> With the wheel connected before the program started:
> type=3 code=0 value=32914
> type=0 code=0 value=0
> type=3 code=0 value=32913
> type=0 code=0 value=0
> type=3 code=0 value=32912
> type=0 code=0 value=0
> type=3 code=0 value=32911
>
> When re-connecting the wheel while the program is running:
> type=58304 code=4187 value=243335168
> type=58304 code=4187 value=293666816
> type=58304 code=4187 value=343998464
> type=58304 code=4187 value=394330112
> type=58304 code=4187 value=25329665
> type=58304 code=4187 value=75628544
> type=58304 code=4187 value=75628544
> type=62336 code=4187 value=16941055
> type=62336 code=4187 value=16941055
> type=62336 code=4187 value=16941055
>
> *Kernel version* (/proc/version)
> Linux version 5.7.0-rc5-amd64 (debian-kernel@lists.debian.org) (gcc 
> version 9.3.0 (Debian 9.3.0-12), GNU ld (GNU Binutils for Debian) 
> 2.34) #1 SMP Debian 5.7~rc5-1~exp1 (2020-05-10)
>
> /proc/cpuinfo, /proc/modules, /proc/ioports, /proc/iomem, lspci -vvv 
> and usb-devices outputs are attached.
> The system is an up-to-date Debian Unstable installation.
>
