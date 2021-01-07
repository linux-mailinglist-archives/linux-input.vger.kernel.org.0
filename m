Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715542ECC89
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 10:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbhAGJQW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 04:16:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:44184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727482AbhAGJQW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Jan 2021 04:16:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 670E323333;
        Thu,  7 Jan 2021 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610010941;
        bh=EATL1E3vts1uZLP6XW8KqMWoW07IHEUbcxRLE7iowPw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZazXfds2LWVKkGxbInhIa4luFi7oWVVOwsax7wFPLg4AGwacvrr5CngOhTr+tzWdx
         KG7m3I/9Xd9skLIVuZn1/Bzu7aeGPR7+vDLZJRtO0CC9JFB/I0RoZT17GCAdfLc3ig
         xlZIN1GJowoJhk3parKwVHXGZ9wHE5Z4fW9aFKRxxprC8VmmdcDLe3ltzI8rpY8VC8
         gctARsdOIV4T+GLxWTBFjYepgksuo0kL0zFn+2J+GHa8SQpsRtzhZZlgUJq8dLNw9x
         ngsyVwGGpJdvCY+BI77aMjygy/BK+IjqBYqE8malo94Fkaiu7cjv/SKYDfFEDnl4X2
         ItekXccU6OD1Q==
Date:   Thu, 7 Jan 2021 10:15:38 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Tom Rix <trix@redhat.com>
cc:     david.rheinsberg@gmail.com, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: wiimote: remove h from printk format specifier
In-Reply-To: <20201215145928.1912641-1-trix@redhat.com>
Message-ID: <nycvar.YFH.7.76.2101071015300.13752@cbobk.fhfr.pm>
References: <20201215145928.1912641-1-trix@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 15 Dec 2020, trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> See Documentation/core-api/printk-formats.rst.
> h should no longer be used in the format specifier for printk.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied this one too. Thanks Tom.

-- 
Jiri Kosina
SUSE Labs

