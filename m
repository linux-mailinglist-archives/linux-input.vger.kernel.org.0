Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74B2C13634A
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2020 23:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728686AbgAIWhN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jan 2020 17:37:13 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:54436 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgAIWhN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jan 2020 17:37:13 -0500
Received: by mail-wm1-f44.google.com with SMTP id b19so4754370wmj.4
        for <linux-input@vger.kernel.org>; Thu, 09 Jan 2020 14:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=wYe1YI1RD2/fEIPQIs3n8zu0r62e11M98CrwImHCtng=;
        b=g41j/iMv1MLDla7tCe3Udh9SWz9WxcaghliLfO/kgEUcRjDmVAbIe7Zsyu7iO7eFnC
         NSMm0ELq4FWfxatbmvS7XN7BqK4F40mJwUVPkBsWMSatmPPZYFWMbKrfN4N8tkIJE126
         caXNbVEPMs3XTInB3Lp3xQQ3a/a8/pscvYnfo1ujHT/JdzmGg/YG+jUTMXgB1z6zN7z4
         hZffkCVDc90UwThWZ/ZhcJRPbgu6iDS44gpab/Y3WoVrqhzyVoYCxh3tfRoIVEEcSs3Z
         hPriSfuGwTjRe/XTel/3Qn26SUXymmqqjjHOGdhSCdm3CVRIa9QmBP6swtTe99vVZiah
         szxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=wYe1YI1RD2/fEIPQIs3n8zu0r62e11M98CrwImHCtng=;
        b=PlGCD8lONfqfkE3TGN7JjRUmYIwoueInoZyZsypNo/4n2A5OBbXb8UPAUqbMvVeA5l
         7Pkf7VWTBpOwS+n5SNdjsSNUAGz/rl32i6HdrY9x07mntawXEw+1lNSAsqGOrqKiptug
         na9DzyHBnfQekc+bDc1DSVVhUt0vqQGYdl0urNH1Qibr1EmHwI3S1CLfFvZVrAnaGcHk
         61+MVtU5it2M2aT3XkCowuLdEp+Zbs7p6/4dz2Oh5JyOcgMoUUeAXkOyle/UaexJeeUe
         badaJ3e648TYhsThFQWMRbrupNu/WTFYIk2rfqxjh1M4e0yV/+bEKtnbyo/0NqWYi2bw
         L0ow==
X-Gm-Message-State: APjAAAWCk+Fi79sSA83BkiMR8RpJWljKLphUyiCqmgQgCIClsuuKa1cY
        xsVaNRNVLzpHWIvC+aop0Vo=
X-Google-Smtp-Source: APXvYqzBmoWVLL6nKSmA65XqFd4I/pAzouo1twSSY06UQr/HoOqCeCjd8P5pryC7vmlMwSJV8gMlBw==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr236817wmc.154.1578609431519;
        Thu, 09 Jan 2020 14:37:11 -0800 (PST)
Received: from [127.0.0.1] (clanjadewolf.net. [2a01:4f8:172:2b9e::2])
        by smtp.googlemail.com with ESMTPSA id e6sm9914063wru.44.2020.01.09.14.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 14:37:10 -0800 (PST)
From:   Mike Murdoch <main.haarp@gmail.com>
Subject: High CPU usage on RMI4 interrupt with Synaptics touchpad
To:     linux-input@vger.kernel.org
Cc:     benjamin.tissoires@redhat.com
Message-ID: <fb009d40-13f9-fc20-1186-77b60eac244a@gmail.com>
Date:   Thu, 9 Jan 2020 23:37:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings,

I'm running kernel 5.4.7 on a recently acquired a Lenovo Thinkpad X1 
Extreme Gen 2. It has a Synaptics touchpad and a Elan trackpoint being 
passed through.

When the psmouse module loads normally, I get a message indicating it 
can support a different bus:

psmouse serio1: synaptics: Your touchpad (PNP: LEN0402 PNP0f13) says it 
can support a different bus. If i2c-hid and hid-rmi are not used, you 
might want to try setting psmouse.synaptics_intertouch to 1 and report 
this to linux-input@vger.kernel.org.

Upon reloading the module with synaptics_intertouch=1, the touchpad and 
trackpoint return, here's the kernel log:

rmi4_smbus 5-002c: registering SMbus-connected sensor
rmi4_f34 rmi4-02.fn34: rmi_f34v7_probe: Unrecognized bootloader version
rmi4_f34: probe of rmi4-02.fn34 failed with error -22
rmi4_f01 rmi4-02.fn01: found RMI device, manufacturer: Synaptics, 
product: TM3512-010, fw id: 2956703
input: Synaptics TM3512-010 as /devices/rmi4-02/input/input41
serio: RMI4 PS/2 pass-through port at rmi4-02.fn03
psmouse serio6: trackpoint: Elan TrackPoint firmware: 0x11, buttons: 3/3
input: TPPS/2 Elan TrackPoint as 
/devices/rmi4-02/rmi4-02.fn03/serio6/input/input42

However I notice that cursor movement with the touchpad is now quite 
choppy and causes a LOT of CPU usage on irq/165-rmi4_sm. Clearly 
something is not working as intended. Curiously, I think I managed to 
get RMI4 to work properly *once*, but cannot reproduce it anymore. Might 
have been a fluke or my imagination too...

I'll be glad to help figure this out.

Thanks and best regards,
- Mike
