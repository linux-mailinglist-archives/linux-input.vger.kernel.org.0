Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56F13107AA
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 10:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhBEJV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 04:21:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:33656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230348AbhBEJSm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Feb 2021 04:18:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA64F64F70;
        Fri,  5 Feb 2021 09:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612516682;
        bh=Ww2Vwvvw8i2wnSjUBXe7iEG1fGXTfTU7aKkvWbgYolg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=MSUc2ErLVn9V1PfD+EF4w0Y7DNY4G6QNLlkeXwT2SmJIxEafUSvEDEOW3satRIP3a
         VzH3zTEfX6QWhUUVS/O+nfSxAfpKYDf52WvpypxlqIPrtQQ6UyI5wW6fvwgCXBNBrI
         2NjCWAhAh2QO5wBQgRo7o/RW7xby1Vod+8wWXe4o6cwPEqFew39gbl9KCFs7JMJfYA
         p/gBTharR4tn+VZSFwZ3PGSplrNVGpnNB8BaaVCFPgfjNItzvPS7AOYH0EmdcRH5gU
         3qAlzO2PqBbKM7XfHyOK+UtN7wacSdgpYKCedCqUHQjiMuPrVTs7emoGYI1eV6lrpI
         s+OYGjlW6ykiQ==
Date:   Fri, 5 Feb 2021 10:17:58 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
cc:     erazor_de@users.sourceforge.net, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: displays: convert sysfs sprintf/snprintf family to
 sysfs_emit
In-Reply-To: <1612258261-96457-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Message-ID: <nycvar.YFH.7.76.2102051017520.28696@cbobk.fhfr.pm>
References: <1612258261-96457-1-git-send-email-jiapeng.chong@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2 Feb 2021, Jiapeng Chong wrote:

> Fix the following coccicheck warning:
> 
> ./drivers/hid/hid-roccat-arvo.c:45:8-16: WARNING: use scnprintf or
> sprintf.
> 
> ./drivers/hid/hid-roccat-arvo.c:95:8-16: WARNING: use scnprintf or
> sprintf.
> 
> ./drivers/hid/hid-roccat-arvo.c:149:8-16: WARNING: use scnprintf or
> sprintf.
> 
> Reported-by: Abaci Robot<abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Appplied.

-- 
Jiri Kosina
SUSE Labs

