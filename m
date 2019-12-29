Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFB412CAC9
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2019 21:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfL2UmK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 15:42:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:49026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbfL2UmK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 15:42:10 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BA3A207E0;
        Sun, 29 Dec 2019 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577652129;
        bh=9A1GT7JTdZZyrH+F7P5nhc/s/Ch+Nj6eiq7D6FyJpvg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZdnGa1+BACKulp3414bThSiFLYqSsJMW7maDjPPprdmYXGc/f7pwW11E/bj4ra25Z
         +pxS0/6jaogiPpKqlsqeaVFCzWRhh88yOKcx1wkOgD2oX4arxIf1PZ1s1O7N+wz0Ud
         keJJxKhdQr1ctMglEdkRjbLyhvva5tu2IrkGuMQ4=
Date:   Sun, 29 Dec 2019 21:42:06 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Tiger Lake PCI device ID
In-Reply-To: <20191227214057.31438-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.1912292140210.4603@cbobk.fhfr.pm>
References: <20191227214057.31438-1-srinivas.pandruvada@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 27 Dec 2019, Srinivas Pandruvada wrote:

> Added Tiger Lake PCI device ID to the supported device list.

Applied to for-5.5/upstream-fixes. Will send it to Linus some time in the 
next decade :P

Thanks,

-- 
Jiri Kosina
SUSE Labs

