Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EE9213E32
	for <lists+linux-input@lfdr.de>; Fri,  3 Jul 2020 19:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgGCRIm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jul 2020 13:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgGCRIm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jul 2020 13:08:42 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4633C061794
        for <linux-input@vger.kernel.org>; Fri,  3 Jul 2020 10:08:41 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id h28so28387006edz.0
        for <linux-input@vger.kernel.org>; Fri, 03 Jul 2020 10:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:to:from:subject:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=AKomXik6twl+d2UbVRhuPo/6ZO3GNZ9kFCIgK0z1ZfI=;
        b=PjFNh+/qSzaPwa7y1HD3Rb1WohV8s8N07uZs3kf/S82pja2jAjZWNgPGN6JagHjFv8
         F6O88PqE849ftnUumAc4BnL0tXyNKwtsHoWRgveBT7nYevRLDdiLXuAc7PfrbncMJzEI
         OYrUMBGMirRuOJqxwDGdZc2wAj0lunuC4qu2WkkqSHIvr3746XoeEqWEL2yMs2XgQXs+
         XCaE7Hhcq5r3/oIG+O1BLPoY8dSrKQ5bm2AVBjle6sApMhIF+NOeroZ3Q1LuMBHWuEIR
         vEF20Ge3qsYLyCnjr+R+xZkFV02MlPwdYDldFbkZY+yiChBLUFPcoWpEWV4h9EkZEYQR
         RdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:to:from:subject:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=AKomXik6twl+d2UbVRhuPo/6ZO3GNZ9kFCIgK0z1ZfI=;
        b=dNDZARI/aeA8bn69lcqKDUfWBacrpDV8Wej1rJLNd7eqNbzo1SD6RuNOOjyHDXqcBD
         +I+J+igM3orpdqQm4+cRlN7+HbRfNoN9DhytV7XOU+CH7R4A2BfQtbxUQUXyWyvjcTgi
         hwoKo6V+GoaWvVPrYwLJ2zq9BcAwRqRjiCaVkcEfVkiPyiwSxD1JpSBIiryCKYCcknUs
         oFVBuJ6d+VDRTM7kqc+JLgQx7dIbqkabIja/L/4M0XwnDH/mYPdZ54+KI/UEXu/odGTu
         G5jENjRcanZC+ZmfOqVTyEDokXjq3qFR/5wR/rjTeNXs9SvsZ2+WQWIjFzcnB6ZG/z58
         5hzw==
X-Gm-Message-State: AOAM530+jxar4dvjsBmn/HOE/GUuiSM+tgCWrj7GNKY2P8wTQAnRjVQw
        YdQ1qsIO/Z1/tSTBkHJcon1ga/3rt8s=
X-Google-Smtp-Source: ABdhPJzJlp8tMD/VboVsdH1Nqg2y7ERQbJqwRQvjEqYgSLJGU5WRZIYzY3bylCksPdDx76WLA1+D4w==
X-Received: by 2002:a05:6402:1d14:: with SMTP id dg20mr4908052edb.23.1593796120322;
        Fri, 03 Jul 2020 10:08:40 -0700 (PDT)
Received: from [192.168.178.20] (p5b2d86d0.dip0.t-ipconnect.de. [91.45.134.208])
        by smtp.gmail.com with ESMTPSA id v5sm9414381eje.88.2020.07.03.10.08.39
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2020 10:08:39 -0700 (PDT)
Message-ID: <5eff6617.1c69fb81.8d907.b3f6@mx.google.com>
To:     linux-input@vger.kernel.org
From:   smesgr <smesgr@gmail.com>
Subject: force Nacon Compact Controller from xpad to hid-sony
Date:   Fri, 3 Jul 2020 19:08:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-LU
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I bought a Nacon (formally BigBen Interactive) Compact Controller for PC 
and PS4 [0x146b:0x0603]. All USB devices for the vendor BigBen are 
currently handled by xpad driver.

If plugged-in the usb interface descriptor looks like a Xbox360 
controller nock off with an vendor specific device class. I assume to 
support Windows PCs without an additional driver. Neither the audio 
audio jack nor the touch pad work with xpad driver. If plugged-in with 
SHARE/OPTIONS button pressed the device is suddenly a DragonRise Inc. 
Updater [0x0079:0x1836] with a HID interface.

Bacause the device works fine with a PS4 I would like to force hid-sony 
to takeover the device. I removed the 0x146b from xpad driver. Added the 
device to hid-sony.c and hid-quirks.c device table. But the device is 
still not matched. Afaik because the device does not have a HID 
descriptor. Do I need to forge a fake descriptor? Has anybody done 
similar things and could point me to the correct bits missing.

Best Regards

Stephan

