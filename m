Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2B6A56819
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 13:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZL7d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 07:59:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZL7d (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 07:59:33 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 136A02080C;
        Wed, 26 Jun 2019 11:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561550372;
        bh=F3UE4yy00yiBrIMHOnyh4Jj3PqABFwAfqaw5slMEPdw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=yWThOIKMzcZblv/mRJFzBJ1JxVXN5LCD9TBbQCwswJ5DRdFYGp8uCYdhfzdEMbmUS
         x7G0O2UpWaWutkrj3jrAw3fuFAB8wlWGUBE7zwXPlhhxVFo1yGzfyv6UDN0WyHQ+95
         oFgv9zQhTMrQIYkGPexA/pyaUA0HAk9BahwuFCkk=
Date:   Wed, 26 Jun 2019 13:59:29 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        killertofu@gmail.com, skomra@gmail.com,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: add new MobileStudio Pro support
In-Reply-To: <1561333963-12055-1-git-send-email-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.1906261356050.27227@cbobk.fhfr.pm>
References: <1561333963-12055-1-git-send-email-ping.cheng@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 23 Jun 2019, Ping Cheng wrote:

> wacom_wac_pad_event is the only routine we need to update.

I'll change this changelog to 'add product ID for new MobileStudio Pro' 
and apply.

Thanks,

-- 
Jiri Kosina
SUSE Labs

