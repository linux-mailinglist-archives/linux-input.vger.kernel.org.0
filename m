Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461B7305FEC
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 16:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbhA0Pm7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 10:42:59 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:49311 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236084AbhA0Pid (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 10:38:33 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MJFpj-1lOvKr1GXL-00KeAs; Wed, 27 Jan 2021 16:35:38 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v1 3/3] Updated MAINTAINERS
Date:   Wed, 27 Jan 2021 16:35:33 +0100
Message-Id: <20210127153533.21560-4-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127153533.21560-1-mail@richard-neumann.de>
References: <20210127153533.21560-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v7SOAhV0Vpk6JIWS/laQe2eWzMwhukhUpjk8MOQk7/B4ZqY5k9U
 HkOfX+rFzVeb58+XVWNydcnRpe0psFGNWzUxmN58d6r0Gjc6AGhmjzfSgtEac/+fMnnemTe
 bEEByXbMyJnEUJkepGYN9s88t8EpefzESPAZZ5h+tOx3mF6Z8hS0KORfNDtS8VWryexJ1Ea
 ZmzsT2ZUKynaLW7xG4DAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YJNFv3CjWMs=:Z3AY8H/yCRzA+IvVZGe/PU
 3tGmC2qp9INaGDF1658mig3iTFLP+qC/hg2QKQUsevrAQ5f0ylw7FgPI2QZQICMZ6WAJ36Tx8
 3h2Lh+FAiTmIIkjBf5BUhdeZ+lKgP8WMjpnorMHMKXjyp2K96jJZ4q0grgvXpuVWsHFycuT+W
 NYw8g5rRFG6DY0oUWinenrm7RB3+/vNrTS/s9eMpJHM2FsSSLucm8CKjhR2Oc1pRI+GPjdiPZ
 JhZG3aiEvzP5ofwTvZxWTT+tkYpvnZhLAAr9XsCv5yMSwQjuE+TW7ed9uajKxgvmKyVQRA3yc
 4XkL47o1FqEkB1Vx79tMNNaJ5EhRm3ZJp2lqXQpwYt29Ugz5cthzCUGSHg9+9mLyzjvPtD3m+
 KbmhTa4krVg4jvrytoQjg0WbDEgwmngQOx7DnqZvNwc1vkip/hwVnbx4FMwsPtln9pVaLrQPd
 q5y/ynfZiA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Added Richard Neumann (me) to the list of maintainers for the
AMD Sensor Fusion Hub driver.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 992fe3b0900a..de28236a08fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -958,6 +958,7 @@ F:	drivers/net/ethernet/amd/xgbe/
 AMD SENSOR FUSION HUB DRIVER
 M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
 M:	Sandeep Singh <sandeep.singh@amd.com>
+M:	Richard Neumann <mail@richard-neumann.de>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/hid/amd-sfh*
-- 
2.30.0

