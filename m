Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83AE190CBB
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 12:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgCXLvE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 07:51:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:49514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727066AbgCXLvE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 07:51:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2FB1208C3;
        Tue, 24 Mar 2020 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585050663;
        bh=GbjME65ILfkmi8zJstR/SFqAkxmeGRJlOv2QSmeTsWg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SelyDidDQxeilzoIowIkSureeYmuqpKBdTJT15rQEZ/Fu5q6pCoTIkPiCgt2REO5W
         uR1PkqKJRSfa7aEEpJQNpyCQjlng6o6oeL4X5t5M0vp+sy6k/0FhNIUsM1iHa4K50h
         Bu2+mDmKg/hHaOCjvvTGgPVLXrq3yMd+tw/w0GOY=
Date:   Tue, 24 Mar 2020 12:50:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rajat Jain <rajatja@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, dtor@google.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, furquan@google.com,
        dlaurie@google.com, bleung@google.com, zentaro@google.com,
        dbehr@google.com, rajatxjain@gmail.com
Subject: Re: [PATCH RESEND 1/5] input/serio/i8042: Attach fwnode to serio
 i8042 kbd device
Message-ID: <20200324115059.GA2333340@kroah.com>
References: <20200323234505.226919-1-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323234505.226919-1-rajatja@google.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 23, 2020 at 04:45:01PM -0700, Rajat Jain wrote:
> Attach the firmware node to the serio i8042 kbd device so that device
> properties can be passed from the firmware.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Change-Id: I36032f4bdee1dc52f26b57734068fd0ee7a6db0b

Didn't you run checkpatch.pl on your patches which told you to remove
all of these Change-Id: values?

Please do so...

greg k-h
