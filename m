Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B665D3120
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 21:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbfJJTIs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 15:08:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:36218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbfJJTIs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 15:08:48 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3878020659;
        Thu, 10 Oct 2019 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570734527;
        bh=0jkUH/Ad2OiIhYq+UOG5EPpU3+ItDjbe0bA9hPWEABQ=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=tYwoHJF2sL0ZTl80fRjeidFIPf172r/LoZb11riLsNH7WnxtAxCaosYOecm3ku29/
         WEJWRywHMiVuf6C3AM5RwRJ17aZDqaJoECI1hnUjT6SrAg84YjxNj7116dzvNm6D+4
         Iv+xjRz3OhN5RTL648NFWMen0OJfkgU6hRVx9J7s=
Date:   Thu, 10 Oct 2019 21:08:17 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dtor@chromium.org, ikjn@chromium.org
Subject: Re: [PATCH 1/2] HID: google: add magnemite/masterball USB ids
In-Reply-To: <20191003031800.120237-1-drinkcat@chromium.org>
Message-ID: <nycvar.YFH.7.76.1910102108020.13160@cbobk.fhfr.pm>
References: <20191003031800.120237-1-drinkcat@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 3 Oct 2019, Nicolas Boichat wrote:

> Add 2 additional hammer-like devices.

Applied to for-5.4/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs

