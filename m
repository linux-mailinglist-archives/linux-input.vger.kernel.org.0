Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1772C192F0
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2019 21:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbfEITbq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 May 2019 15:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726710AbfEITbp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 May 2019 15:31:45 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB4B421479;
        Thu,  9 May 2019 19:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557430305;
        bh=YmeN81SyseqDWB/CkOULDdQIOCFiOC+8Sw3fpE/CAAg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=e19P3JIC1ltQBD4w7MWvlIRU33CyWlgGaVNurbbjmpH4J9AXVTl5QkG5QHHaDuwql
         TRKXWe91y79CV267aDQ3yciv+ND30hCgUoCnrkD2JaVw/ADuRZXfhr51Ar7rV2OGrC
         2R4MPWHX8eObfF4qgINkiMeRaA3roE5KL4Cevk/I=
Date:   Thu, 9 May 2019 21:31:42 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: logitech-dj: add support for the Logitech
 MX5500's Bluetooth Mini-Receiver
In-Reply-To: <20190428192552.28201-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1905092131330.17054@cbobk.fhfr.pm>
References: <20190428192552.28201-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 28 Apr 2019, Hans de Goede wrote:

> Add support for the HID proxy mode of the Logitech Bluetooth Mini-Receiver
> which comes with the Logitech MX5500 keyboard. This receiver works the same
> as the Bluetooth Mini-Receiver coming with the MX5000 keyboard and also
> presents itself as an USB-hub with 2 separate USB devices for the keyboard
> (boot sub-class) interface and for the (boot sub-class) mouse interface.

I've applied both patches, thanks.

-- 
Jiri Kosina
SUSE Labs

