Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D4C497F51
	for <lists+linux-input@lfdr.de>; Mon, 24 Jan 2022 13:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239503AbiAXMYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 07:24:20 -0500
Received: from mail.zeus.flokli.de ([88.198.15.28]:53918 "EHLO zeus.flokli.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239140AbiAXMYU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 07:24:20 -0500
Received: from localhost (ip-178-200-100-55.hsi07.unitymediagroup.de [178.200.100.55])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: flokli@flokli.de)
        by zeus.flokli.de (Postfix) with ESMTPSA id AEF681279D49;
        Mon, 24 Jan 2022 12:24:18 +0000 (UTC)
Date:   Mon, 24 Jan 2022 13:24:17 +0100
From:   Florian Klink <flokli@flokli.de>
To:     ValdikSS <iam@valdikss.org.ru>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II
 support
Message-ID: <20220124122417.pl4qhpb644xp4ax3@tp>
References: <20211216224611.440397-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20211216224611.440397-1-iam@valdikss.org.ru>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey ValdikSS,

>This patchset adds support for Lenovo ThinkPad TrackPoint Keyboard II,
>in both USB and Bluetooth modes.
>
>It brings additional functional keys mapping, native vertical and horizontal
>scrolling, trackpoint sensitivity configuration and Fn-Lock sync.

Quick follow-up question on this - did you do any tinkering with battery
status?

I realized there's a
/sys/devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb6/6-2/6-2:1.1/0003:17EF:60EE.001F/power_supply/hid-0003:17EF:60EE.001F-battery
in my system, which knows about model_name, but things like "capacity"
and "status" return a "No data available".

Regards,
Florian
