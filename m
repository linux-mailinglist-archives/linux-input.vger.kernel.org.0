Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EA72C999C
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 09:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgLAIgR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 03:36:17 -0500
Received: from mail.v3.sk ([167.172.186.51]:58874 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727343AbgLAIgR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Dec 2020 03:36:17 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 7F238E070D;
        Tue,  1 Dec 2020 08:32:40 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id idyA1Q4AdZg2; Tue,  1 Dec 2020 08:32:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 3184CE06C5;
        Tue,  1 Dec 2020 08:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id z9J0qottMIDi; Tue,  1 Dec 2020 08:32:40 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 0121FDF9A4;
        Tue,  1 Dec 2020 08:32:39 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add driver for power button on Dell Wyse 3020
Date:   Tue,  1 Dec 2020 09:35:31 +0100
Message-Id: <20201201083533.1724287-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

please consider applying the patches chained to this message. It's a
rather simple driver for a power button on Dell Ariel board along with
the Device Tree binding document.

Compared to previous version, it fixes a validation warning in the DT
bindings. Change logs are present in individual patches.

Thank you
Lubo


