Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC4B98FEE
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 11:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730804AbfHVJpy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 05:45:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:47774 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725799AbfHVJpy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 05:45:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F0A84AFA4;
        Thu, 22 Aug 2019 09:45:52 +0000 (UTC)
Message-ID: <1566467151.8347.23.camel@suse.com>
Subject: Re: [PATCH] HID: quirks: Disable runtime suspend on Microsoft Corp.
 Basic Optical Mouse v2.0
From:   Oliver Neukum <oneukum@suse.com>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Date:   Thu, 22 Aug 2019 11:45:51 +0200
In-Reply-To: <20190822091744.3451-1-kai.heng.feng@canonical.com>
References: <20190822091744.3451-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Donnerstag, den 22.08.2019, 17:17 +0800 schrieb Kai-Heng Feng:
> The optical sensor of the mouse gets turned off when it's runtime
> suspended, so moving the mouse can't wake the mouse up, despite that
> USB remote wakeup is successfully set.
> 
> Introduce a new quirk to prevent the mouse from getting runtime
> suspended.

Hi,

I am afraid this is a bad approach in principle. The device
behaves according to spec. And it behaves like most hardware.
If you do not want runtime PM for such devices, do not switch
it on. The refcounting needs to be done correctly.

This patch does something that udev should do and in a
questionable manner.

	Regards
		Oliver

