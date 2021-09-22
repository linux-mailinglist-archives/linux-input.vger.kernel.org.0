Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1F1414594
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 11:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhIVJzK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 05:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:59474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234381AbhIVJzK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 05:55:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92C6D60F23;
        Wed, 22 Sep 2021 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632304420;
        bh=+cTQUM28++tatyXmuGD4ODhiJXJl5PZFyxISF/LZg4M=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=KeNcycvY+yzZSY3g3MvgHe4hvuxryevdrroEUvq8DhxBWJJg0yCq1yyCHnmn0AanN
         T9AAx668pRhJLE17DCL91YhbVThKIzjlvC0UF9pkqofpigrcWrYW0uSgFtjEZGTVzv
         +JMAiw4vhMfM8hVknm0v1Q/9o7mV/qWKAa5ke/qWAmbWeaeQGQfPnTKBkvwBz3wCCL
         8HampIsedCY+wPS2uy7GbojuZ9DsW4Vd6Tk8pRuSwhQX17l0TCkvrm2s4vp5/l1Fvh
         ln/861oC4h06Q+vXo54VnrSOyOAw6o9naqgPWS9Kg7TYdMI+r333qHGoJ0pM7X7bvX
         2Sq8V3mzScB0g==
Date:   Wed, 22 Sep 2021 11:53:37 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ilya Skriblovsky <ilyaskriblovsky@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3] Support for side buttons of Xiaomi Mi Dual Mode
 Wireless Mouse Silent Edition
In-Reply-To: <YUcbJFPUzt82vil7@ilya-330s>
Message-ID: <nycvar.YFH.7.76.2109221153230.15944@cbobk.fhfr.pm>
References: <YUcbJFPUzt82vil7@ilya-330s>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 19 Sep 2021, Ilya Skriblovsky wrote:

> This patch enables side-buttons of Xiaomi Bluetooth mouse (specifically
> Xiaomi Mi Dual Mode Wireless Mouse Silent Edition).
> 
> The mouse sends invalid button count in its HID Report Descriptor and
> this patch just replaces its descriptor with corrected one. With this
> driver side buttons work as expected acting like Back/Forward buttons.
> 
> Signed-off-by: Ilya Skriblovsky <ilyaskriblovsky@gmail.com>

I've added 'HID:' prefix to the shortlog and applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

