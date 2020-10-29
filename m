Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A1629EF53
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 16:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgJ2PL6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 11:11:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:39900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgJ2PL6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 11:11:58 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 481562072C;
        Thu, 29 Oct 2020 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603984317;
        bh=IiGO1pYMcFg/tuhIdgFf1x9KK7CqZdXxeqBogJwOcOk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=TZYdpdHxyVaARxhmpeSizJ4NPwkOc/ZkKUNJEhSenqA4uzOC+rv6OJpiffi9zbnY9
         pBXm9eNgQrV4uyKKW2nNeTXuMSk2tI1338bXpb22NabLvtdHQbZUxwmrftsz7tosEU
         Z2vYb0uRZmt/wvrwz/b9hDnQ+GDYPOADH+M1kUsY=
Date:   Thu, 29 Oct 2020 16:11:54 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Coiby Xu <coiby.xu@gmail.com>
cc:     linux-input@vger.kernel.org,
        =?ISO-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: show the error of failing to fetch the
 HID Descriptor
In-Reply-To: <20201021143305.475182-1-coiby.xu@gmail.com>
Message-ID: <nycvar.YFH.7.76.2010291611420.18859@cbobk.fhfr.pm>
References: <20201021143305.475182-1-coiby.xu@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 21 Oct 2020, Coiby Xu wrote:

> i2c_hid_probe should notify the user of the error of failing to fetch
> the HID Descriptor instead of silently exiting.
> 
> Link: https://forum.manjaro.org/t/elan-touchpad-working-in-live-but-not-in-native-os/31860/55
> Cc: Barnabás Pőcze <pobrn@protonmail.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

