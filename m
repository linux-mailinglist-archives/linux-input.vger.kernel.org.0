Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F33F458770
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 01:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhKVAlM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Nov 2021 19:41:12 -0500
Received: from devianza.investici.org ([198.167.222.108]:23939 "EHLO
        devianza.investici.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhKVAlM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Nov 2021 19:41:12 -0500
Received: from mx2.investici.org (unknown [127.0.0.1])
        by devianza.investici.org (Postfix) with ESMTP id 4Hy7fP0D09z6vKN
        for <linux-input@vger.kernel.org>; Mon, 22 Nov 2021 00:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1637541485;
        bh=V0q5B9qvFgFTMXb14QZ53bTj5TQQreE3P/KfmW8Ctu4=;
        h=From:To:Subject:Date:From;
        b=AozxmWQDeyMr2BhNifLOyxSVtbDAdx9iJ1vtMkjNgIB888AeEB6stKl33Qk9rRGVe
         bMahP/YYFCt4EvB5I4DmSXBbXoLKqUIq47JYWKxm0owJ8g4U+tZm6tBKoYGg+ob1ND
         z4eHk4OjgTYaEfd8KsEWpRd1GG0dg7T64LYInbA8=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108]) (Authenticated sender: andrea.monaco@autistici.org) by localhost (Postfix) with ESMTPSA id 4Hy7fN6DBVz6vKF
        for <linux-input@vger.kernel.org>; Mon, 22 Nov 2021 00:38:04 +0000 (UTC)
From:   Andrea Monaco <andrea.monaco@autistici.org>
To:     linux-input@vger.kernel.org
Subject: i2c_hid: Possible workaround to Synaptics touchpad going wild on
 Acer Aspire
Date:   Mon, 22 Nov 2021 01:38:03 +0100
Message-ID: <87ee79f2j8.fsf@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hello,


as I wrote in previous emails to this list, my Synaptics touchpad
(SYN1B7F) on Acer Aspire laptop sometimes starts acting wild, it moves
and clicks and drags on its own.  I can't find any trigger for this
behavior, it just happens.

I see long sequences of HID reports that are identical expect for the
timestamp when this happens; my hypothesis is that the issue is on the
hardware, possibly a buggy firmware of the touchpad.

Unloading and reloading i2c_hid solves the issue, probably because it
triggers a hardware reset of the device.


So I came up with a possible workaround: any time the kernel detects two
consecutive HID reports that are identical except for the timestamp, it
hard resets the device.  The user would experience a very brief
discontinuity in mouse response, still much better than current
behavior.

This particular hack could be activated with an option to the relevant
module(s), or when the affected touchpad models are found.


Any comments or suggestions?



Warmly,

Andrea Monaco
