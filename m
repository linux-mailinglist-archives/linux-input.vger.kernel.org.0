Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DFDAA3B8
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 15:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730633AbfIENC3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 09:02:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbfIENC3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Sep 2019 09:02:29 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79C8A21A4C;
        Thu,  5 Sep 2019 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567688547;
        bh=RX1xXE2XDMfRRXyPzta0vdXNb0VntX5esK1oZdSbdio=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=GMVko0DA3mRPNqgir0XVwGMvIrKY+ccDHcixGBlRkzTgnFKDA1QhvBSM+DtFcT0ov
         amInsYQ+F6LeDNG6EkO+N1Tn+LYEnbraMaGrVoUqS3TJuWWKDxAw5u0/BqFFY1kWwa
         m6RdYxUSxQpvyhY++5VHhadf5/yMUiGOg3lqaOMk=
Date:   Thu, 5 Sep 2019 15:02:12 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ping Cheng <pinglinux@gmail.com>
cc:     linux-input@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: add new MobileStudio Pro 13 support
In-Reply-To: <1567629803-12451-1-git-send-email-ping.cheng@wacom.com>
Message-ID: <nycvar.YFH.7.76.1909051501580.31470@cbobk.fhfr.pm>
References: <1567629803-12451-1-git-send-email-ping.cheng@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Sep 2019, Ping Cheng wrote:

> wacom_wac_pad_event is the only routine we need to update.
> 
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> 
> ---
> Patch is based on Jiri's for-5.4/wacom branch

Applied to that branch now. Thanks,

-- 
Jiri Kosina
SUSE Labs

