Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D88FA71
	for <lists+linux-input@lfdr.de>; Tue, 30 Apr 2019 15:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfD3Nch (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Apr 2019 09:32:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:45060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727534AbfD3Ncg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Apr 2019 09:32:36 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3017C21707;
        Tue, 30 Apr 2019 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556631156;
        bh=nkqy1SU0QtczOCC8nIqP7tfrsWYnwbc33jsstTISlG8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NxL8dH2nvFwzJNM40LUZjwQEXoxcmlpUki3IvVJct6fcFNi9Ee1Fh3XX8QzxMAtqQ
         7sijGQWzDX63iDfLnjmaqYZHBbD1QZyBXC/obi2WIRy9fDBaY0f3zGEKtFAtGkU7c8
         Dtr1QH/KSV+WvZpP6sVo6ws3h+lSKKDmdm6N7Wlw=
Date:   Tue, 30 Apr 2019 15:32:33 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] HID: logitech-dj: fix spelling mistake "Unexpect"
 -> "Unexpected"
In-Reply-To: <20190426131631.26692-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.1904301532210.9803@cbobk.fhfr.pm>
References: <20190426131631.26692-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 26 Apr 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a hid_err error message, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to for-5.2/logitech. Thanks,

-- 
Jiri Kosina
SUSE Labs

