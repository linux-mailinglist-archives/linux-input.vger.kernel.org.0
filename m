Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD972F6101
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 13:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbhANMV5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 07:21:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:55408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbhANMV5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 07:21:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3368723A52;
        Thu, 14 Jan 2021 12:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610626876;
        bh=N0Ht12IpJSy61TQAp8zxZTNjmqp8dhpvnST+AJm8Um0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pT9I3JYbf/jZxbRev50e3QMgG134gSKbLhRCAFvRI7RzQ0lG66evQtpwLTWmr7OpO
         9ySPbSxxU2zSpc/LE3TBV/QC20iq/FUqv409ydqf+9fRUgqEf6w3qc6KvbCFqNkfxN
         CIXsraf/p/STB9XMzzD1NXgAVH4JXrGBTGSF3A9zBOE3j2R6QGuO+SLvhMVQtdwHqv
         x3EYwtMX5KJyI51SLdQVXcLIUBuGXlj2CULJ1EhyPFwSWVT7WlbZbLkLVUOrSXAFZD
         LUapg062BeinK4HevI4OgsT/JJ4sEoy/FdlfYdX8U6B/cjcqTrC8O6WgPbjHL50bty
         zHMhiSb3mrTww==
Date:   Thu, 14 Jan 2021 13:21:13 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Peilin Ye <yepeilin.cs@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Phong Tran <tranmanphong@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wacom: Fix memory leak in wacom_probe()
In-Reply-To: <20201210112258.477636-1-yepeilin.cs@gmail.com>
Message-ID: <nycvar.YFH.7.76.2101141320210.13752@cbobk.fhfr.pm>
References: <20201210112258.477636-1-yepeilin.cs@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 10 Dec 2020, Peilin Ye wrote:

> wacom_probe() is leaking memory. Free `&wacom_wac->pen_fifo` when
> hid_parse() or wacom_parse_and_register() fails.

Thanks for the patch. It's however already been fixed in 
hid.git#for-5.11/upstream-fixes (37309f47e2f5) branch that will be going 
to Linus shortly.

-- 
Jiri Kosina
SUSE Labs

