Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31BE27F580
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 00:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731883AbgI3Wu7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 18:50:59 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:39265 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731866AbgI3Wu6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 18:50:58 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc5b1333;
        Wed, 30 Sep 2020 22:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=7wN4reoOb6h8xIhI90rriKJTi
        S8=; b=Dj8cxfireGteipPLrnkLTxeJQyMPiUNypGfFZi7jUK7lAhHOPtgTlTPQO
        +hL6yddB5w9frmo7dWNifWsjjz1fdwafMyBIqYWsTR3zfQpyhmHeik+yJrGIcCmD
        jDQrndc99YJSsx1F0XuqQHhjucLFpnUUtDyY4CJbbtx7mGclpWku5QbMeiDqg8Au
        ognx/HbMlFup+6H+cB7y6/eQoOftV4VTGIQa3d3ZemeObpS3zkRhwWSIsWMU0uvj
        Yz142bs8VntTIG6dNOa6l6+5rptuAnxLT+MCH4+SNEaRHM9B78cbI+SmVrKn8Cxp
        LO1PAFPbJMYC0pbsd/OSMwQ95XHuQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d2561097 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 30 Sep 2020 22:19:10 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3 0/2] Support trackpoint and touchpad in Thinkpad P1 gen 2 / X1E gen 2
Date:   Thu,  1 Oct 2020 00:50:44 +0200
Message-Id: <20200930225046.173190-1-Jason@zx2c4.com>
In-Reply-To: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These piggyback on the recent F3A support from Vincent Huang to add RMI4
support to the Thinkpad P1 gen 2 and the Thinkpad X1E gen 2.

Jason A. Donenfeld (2):
  Input: synaptics-rmi4 - support bootloader v8 in f34v7
  Input: synaptics - enable InterTouch for ThinkPad P1/X1E gen 2

 drivers/input/mouse/synaptics.c | 3 ++-
 drivers/input/rmi4/rmi_f34v7.c  | 7 +++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
2.28.0

