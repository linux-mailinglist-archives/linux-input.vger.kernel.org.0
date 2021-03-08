Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCEC330AD1
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCHKGg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:06:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:58792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231759AbhCHKGV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:06:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6703764DE5;
        Mon,  8 Mar 2021 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615197981;
        bh=wlxc9luRxtTO47Z1c3K/KXGqq7pfoIkxSExovpemeBU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=iRFVD89/cEqC9+8dBhp0PZja+pQwTuvVb5Y2DAPu11kIzbXJCvbpVVYuaNKI0SBKv
         Fab7O6YioxB4N/yLI0Rm49VKkXZ7Lb1TzaKo/G+D0R1At6KHXuCvVxIYI65ncdbVmZ
         2XkTDUsx/jlIGc8FnaSbcUHIl0VPbdvlU5MS/FwzabN0NfEMFAnjWmNxY+2z2iqYz6
         2yZhOEL2K2a7NsY2JDjuYCMOEUwJm1I2YFyhXi6eSAS1x/Eb8giszmrQ87VlPiAXp7
         5Jgcx5iNa7kRFS+zV8hCylo7dSXktMibkB5oJlzgMkPOzMPOmE018h/Rl0oDIF/c/d
         jx/DHrpa/hcOg==
Date:   Mon, 8 Mar 2021 11:06:18 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH resend 0/2] HID: logitech-dj: Handle Dinovo quad/bt2.0
 receivers in HID proxy mode
In-Reply-To: <20210204205617.72527-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2103081106070.12405@cbobk.fhfr.pm>
References: <20210204205617.72527-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 4 Feb 2021, Hans de Goede wrote:

> This series seems to have fallen through the cracks, so here is a resend.
> This has been tested by my on a Dinovo Edge and I believe that Benjamin
> tested this successfully on a Dinovo Mini.

Now queued in for-5.13/logitech. Thanks,

-- 
Jiri Kosina
SUSE Labs

