Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05489217F7
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 13:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbfEQL6m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 07:58:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727221AbfEQL6m (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 07:58:42 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3B1E220848;
        Fri, 17 May 2019 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558094321;
        bh=2CG6O9VTuzc+b9/OHOOGWBZpQ9g5nKjRxmnb2ivBCZA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=cLv6QWbjqxXfIvzbsKAbxHWlWEt0BVE7w1gONNec1l4OAN4c7voW48a+kCTQoBQmP
         +8POjmJ5a6s7GeSz+4V6gK+TxIPmFTNQ9ObdyTM+gwtkYgJTPWGiya9KePCkSPOkzU
         rC5+d3N0a12ncHWpNZp51Gsof3gGZgPlcA61VnZc=
Date:   Fri, 17 May 2019 13:58:31 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Aaron Armstrong Skomra <skomra@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        pinglinux@gmail.com, jason.gerecke@wacom.com,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: Re: [PATCH 0/4] Intuos Pro 2nd Gen Small
In-Reply-To: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
Message-ID: <nycvar.YFH.7.76.1905171358160.1962@cbobk.fhfr.pm>
References: <1557527479-9242-1-git-send-email-aaron.skomra@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 10 May 2019, Aaron Armstrong Skomra wrote:

> Add support for the Inutos Pro 2nd Generation Small.
> 
> This patch set is based on top of Jason's two existing patch 
> sets sent Apr 24th and May 7th.

I don't think I've seen those two sets ... ?

Thanks,

-- 
Jiri Kosina
SUSE Labs

