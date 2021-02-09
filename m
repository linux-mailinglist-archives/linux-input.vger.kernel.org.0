Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 283CD314C1D
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 10:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhBIJvN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 04:51:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:56156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231235AbhBIJtG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 04:49:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 839FA64E75;
        Tue,  9 Feb 2021 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612864105;
        bh=QKb5uR2FaC1UQMBVMLHQbuc5CegERlpP8AWeNDcOeV8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XPriVzVT58k8qLuUQAWVxCIC7i5ZzZsuY5w7iKC/ZQXS2PJZmA+4LyQOihnA0t4/F
         uWU4Nr8Bwkf+RsBzDJ8jNkcwWFK1S+BDk1cGeCRaa8DaxlUK85DyHsuLmrLBDxPPPY
         ZIvRhd6MJxkx+4DtIk88VEKP8NQNYBW2/RUlvkB0qFbK2OMspkM25cPhTtVoCH1DXT
         RAQAPBrt3KRqdCMGPj2h4fAuyDFPSEbbfzw4EeEyD/HCU5ElG09IDWbOXJVuYD5XsQ
         dxdHqqQAVJzBVYR5J1NKY2AVB1DhdmJkOh79XYhhiknUhIRVTeAVEBj/2JorjKM7EQ
         TR/p2VPEUvrDw==
Date:   Tue, 9 Feb 2021 10:48:22 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Elia Devito <eliadevito@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Ignore battery for Elan touchscreen on HP Spectre
 X360 15-df0xxx
In-Reply-To: <20210122212438.4122-1-eliadevito@gmail.com>
Message-ID: <nycvar.YFH.7.76.2102091048140.28696@cbobk.fhfr.pm>
References: <20210122212438.4122-1-eliadevito@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Jan 2021, Elia Devito wrote:

> Battery status is reported for the HP Spectre X360 Convertible 15-df0xxx
> even if it does not have a battery. Prevent it to always report the
> battery as low.
> 
> Signed-off-by: Elia Devito <eliadevito@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

