Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0FE2C88AF
	for <lists+linux-input@lfdr.de>; Mon, 30 Nov 2020 16:57:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgK3P42 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Nov 2020 10:56:28 -0500
Received: from mail.v3.sk ([167.172.186.51]:47258 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727379AbgK3P42 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Nov 2020 10:56:28 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id AF5A1DF357;
        Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id GBIBxC4YvjUp; Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 29E54E06E1;
        Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id uI9NoU0PHTqJ; Mon, 30 Nov 2020 15:52:51 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id E121BE06C5;
        Mon, 30 Nov 2020 15:52:50 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add driver for power button on Dell Wyse 3020
Date:   Mon, 30 Nov 2020 16:55:35 +0100
Message-Id: <20201130155537.1665091-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

please consider applying the patches chained to this message. It's a
rather simple driver for a power button on Dell Ariel board along with
the Device Tree binding document.

Compared to previous version, issues pointed out in the review by
Dmitry Torokhov have been addressed. Change logs are present in
individual patches.

Thank you
Lubo


