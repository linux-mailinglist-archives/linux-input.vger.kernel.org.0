Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4761980E1
	for <lists+linux-input@lfdr.de>; Mon, 30 Mar 2020 18:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbgC3QVv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 30 Mar 2020 12:21:51 -0400
Received: from mail.eclipso.de ([217.69.254.104]:46848 "EHLO mail.eclipso.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727148AbgC3QVt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Mar 2020 12:21:49 -0400
Received: from mail.eclipso.de (www1.eclipso.de [217.69.254.102])
        by mail.eclipso.de with ESMTP id 54743804
        for <linux-input@vger.kernel.org>; Mon, 30 Mar 2020 18:21:47 +0200 (CEST)
Date:   Mon, 30 Mar 2020 18:21:47 +0200
MIME-Version: 1.0
Message-ID: <ff770543cd53ae818363c0fe86477965@mail.eclipso.de>
X-Mailer: eclipso / 7.4.0
From:   " " <denk@eclipso.email>
Subject: Add a second working PNP_ID for a T470s
Reply-To: " " <denk@eclipso.email>
To:     <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Lenovo Thinkpad T470s I own has a different touchpad with "LEN007a" instead of the already included PNP ID "LEN006c". However, my touchpad seems to work well without any problems using RMI. So this patch adds the other PNP ID.

Signed-off-by: Dennis Kadioglu <denk@eclipso.email>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 4d2036209b45d..758dae8d65006 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -170,6 +170,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN005b", /* P50 */
 	"LEN005e", /* T560 */
 	"LEN006c", /* T470s */
+	"LEN007a", /* T470s */
 	"LEN0071", /* T480 */
 	"LEN0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */
 	"LEN0073", /* X1 Carbon G5 (Elantech) */
---­

---

________________________________________________________
Ihre E-Mail-Postfächer sicher & zentral an einem Ort. Jetzt wechseln und alte E-Mail-Adresse mitnehmen! https://www.eclipso.de


