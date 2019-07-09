Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5142463456
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2019 12:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfGIKav (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 06:30:51 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36630 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfGIKav (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jul 2019 06:30:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so20451036wrs.3
        for <linux-input@vger.kernel.org>; Tue, 09 Jul 2019 03:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=6/dGLZD22+WdpYwx2QX2Fhn2oniz/jp2ygMD+AjsHuk=;
        b=MMywypvg2QzeU+TN1LB+1XvCDQ+vc9CFyE2Ws0mn9n9TKy7UqZPBDJsGldJ16ERSs5
         uagxmfB9y5CT04wC7BeXXEP5RqplKQcBeMMaLkKwLB3e58W7VveIaRJh5aZVdGwFbyOV
         il0OpDctxlEQ8lsOlymGr1S45NFcwZsuyZAX+XzcwsZeILWJSoNOB9PDlOLJvcsS26Rw
         /bQYXIgqFLtrdBnBJ6RpUVOxTHOKDbMeNhC/1cSsDzNBCMVol6JfgCQ9sTtc81r+HOzW
         kl6Jh9VBj1RmadycQWVx1pPE8ttFchycBN/vdBEp7JUsDWVG6u7r98ZjgVJMHFv3dDfT
         pj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=6/dGLZD22+WdpYwx2QX2Fhn2oniz/jp2ygMD+AjsHuk=;
        b=nyZsdGTpJEBCwcTvsfyG8cJqV+/WNL/5b0Wq7K+Yww6dfvfxVrOnzKvakFoe1O63J/
         brtgFoaksiuH0dE2XCMrj/kVd3ZMX4WBZvPd9YBFnVlVWeyeDCmH0wMNjpNVPfUGdBm0
         873VxUr03nWWlarl1h0yUalWJ4huIlcMyZB/E5T9Qvz3Al34e8Co+7QSMgyqXQtk1cU9
         RQRFP7IoWvhU9J6ZGJl5lTdWPjnoOCVoFUePJJmsmJz0rheH9tTehHLF2+5+1VsJUlN+
         hhI48mTiGhi/GR0h3tfPTDmAj5mp7GJMgoS9E5V7epH4MfLcLn0AVI1LueeI3Ma1bSXa
         88sA==
X-Gm-Message-State: APjAAAXVC+SiwEtxHcc8DoEwxrK7ZMUA+WKV4PsQrWr5ZdfH8Y1gVVsH
        WVyCLC+numYD56OBG842ojoOr/ccnSw=
X-Google-Smtp-Source: APXvYqwShae3NPwkb6xyByGfmc6dk5rneCM42c2sh5wTX1GL/y9RyKJd0A6Pi7vRe4y8pXpUzoMiVQ==
X-Received: by 2002:adf:e691:: with SMTP id r17mr4283803wrm.67.1562668248598;
        Tue, 09 Jul 2019 03:30:48 -0700 (PDT)
Received: from ?IPv6:2a02:810c:6c0:70c:e4a4:44c5:7f7a:8e8? ([2a02:810c:6c0:70c:e4a4:44c5:7f7a:8e8])
        by smtp.gmail.com with ESMTPSA id t6sm2585093wmb.29.2019.07.09.03.30.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 03:30:48 -0700 (PDT)
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com
From:   Fabian Henneke <fabian.henneke@gmail.com>
Subject: Potentially different semantics of hidraw's write() between USB and
 Bluetooth transfer
Message-ID: <2dc79196-8403-9c72-7495-6d27527933ad@gmail.com>
Date:   Tue, 9 Jul 2019 12:30:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

when testing hidraw's hid-example.c
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/hidraw/hid-example.c)
with a Bluetooth HID device, I noticed that the write() call always
returns 0 on success, even though the entire buffer has been written and
received by the device.
Following the chain of calls triggered by the call to write(), I
identified hidp_send_message in /net/bluetooth/hidp/core.c:98
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/bluetooth/hidp/core.c#n98)
as the plausible origin of the return value. This function always
returns 0 on success, regardless of the value of its parameter size.

Could you confirm whether this function is really the one used to handle
writes to Bluetooth HID devices? If so, is it intended behavior to have
write() return the number of bytes written for USB HID devices, but not
for Bluetooth HID devices?
