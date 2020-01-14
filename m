Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F030A13AC1E
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 15:19:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgANOT3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 09:19:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:35878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725994AbgANOT3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 09:19:29 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB56324680;
        Tue, 14 Jan 2020 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579011568;
        bh=4mb+XbuRNeJUfsZq/Ih08ahATNeximMfmU4oDJMbbjw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LCIcobCjB5dS4yRnfmC+xBS8XRmASzQ53P0s5cQBrWOvzDt/7BjH1f+9+FO95SxxL
         SxIU+xg/gNUXWg4SxgCL6Y+tR0VTTPLOVIyYD2RNPCS0V5fXEhQXOfGXJYWWJMFCBC
         N1bQNbZ3APZe2wHRXYHZy+dktkjQkOIlug+dLqSU=
Date:   Tue, 14 Jan 2020 15:19:25 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH 1/1] HID: hiddev: remove a duplicated check
In-Reply-To: <50fd522f-e276-420c-3c6a-0f193bc16ca2@huawei.com>
Message-ID: <nycvar.YFH.7.76.2001141518000.31058@cbobk.fhfr.pm>
References: <20191224035117.98816-1-thunder.leizhen@huawei.com> <50fd522f-e276-420c-3c6a-0f193bc16ca2@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 14 Jan 2020, Leizhen (ThunderTown) wrote:

> Does no one pay attention to this problem? Although there is no
> functional problem, but it seems confusing.
> 
>         if (!list->hiddev->exist) {                 <---------
>                 res = -ENODEV;                                |
>                 goto bail_unlock;                             |
>         }                                                     |
>         if (!list->hiddev->open++)                            |
>                 if (list->hiddev->exist) {          <--------- //It's always true.

This code no longer exists after refactoring that happened in commit 
18a1b06e5b91d47.

-- 
Jiri Kosina
SUSE Labs

