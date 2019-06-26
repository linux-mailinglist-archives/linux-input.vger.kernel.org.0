Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3CE5682B
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 14:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726723AbfFZMDm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 08:03:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZMDm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 08:03:42 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 935472080C;
        Wed, 26 Jun 2019 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561550621;
        bh=XNo+DQNTEbXsR2mPqdc/RrN91XvD4N5UrDJ4rt87Les=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=BMedapbckt2uJiRZeN4gp1h+e8aW70LnCIHoBU6qUPCuw7Pm1uzdt25z5lN0y149a
         mNjx6ft2T/navsHhG+wWGXUhIwZLfpBybabkvPmoorIjB5e6Drt9mJv9omGKyCflWe
         eo+g6mnWYsObhQ4YdDWkmAHm1N2IvRGlGOXoWeUY=
Date:   Wed, 26 Jun 2019 14:03:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: Fix forwarding of very long HID++
 reports
In-Reply-To: <20190614082027.4270-2-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1906261403250.27227@cbobk.fhfr.pm>
References: <20190614082027.4270-1-hdegoede@redhat.com> <20190614082027.4270-2-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 14 Jun 2019, Hans de Goede wrote:

> The HID++ spec also defines very long HID++ reports, with a reportid of
> 0x12. The MX5000 and MX5500 keyboards use 0x12 output reports for sending
> messages to display on their buildin LCD.
> 
> Userspace (libmx5000) supports this, in order for this to work when talking
> to the HID devices instantiated for the keyboard by hid-logitech-dj,
> we need to properly forward these reports to the device.
> 
> This commit fixes logi_dj_ll_raw_request not forwarding these reports.
> 
> Fixes: f2113c3020ef ("HID: logitech-dj: add support for Logitech Bluetooth Mini-Receiver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-5.2/fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

