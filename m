Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 323776BB6A
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 13:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731248AbfGQLbP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 07:31:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:34434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732048AbfGQLbO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 07:31:14 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B422D20880;
        Wed, 17 Jul 2019 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563363073;
        bh=xAaSzTjN4BLCl7mY//cGoE5wCGBd3TJKDeqOVTVzU8k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=wmnLoWsRu+B1plujq3r2lS8MXgrUC1jKi2oof1nnMwmQV1S3RI+YvKqYcJ1Xhu4ay
         HQQiUYHVYNhmqEsZXp0+wG9RVm0HuhO/X3e5hB8qvUVE8ZVqiyJ8V2/HryYVxzX4BP
         Kj8JO2lpaqXLqfa+s6844X3gcuaKejrYOJqimk1s=
Date:   Wed, 17 Jul 2019 13:31:03 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     nlopezcasad@logitech.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid-logitech-hidpp: add USB PID for some mice
In-Reply-To: <20190716073726.6726-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.1907171330320.5899@cbobk.fhfr.pm>
References: <20190716073726.6726-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Jul 2019, Filipe Laíns wrote:

> Signed-off-by: Filipe Laíns <lains@archlinux.org>

We generally don't accept empty changelogs for the kernel. I've added at 
least a few words, and comitted.

This applies also to your second patch to logitech-dj. Thanks,

-- 
Jiri Kosina
SUSE Labs

