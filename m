Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DFD35B271
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 02:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfGAA2E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 20:28:04 -0400
Received: from knopi.disroot.org ([178.21.23.139]:44746 "EHLO
        knopi.disroot.org" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726402AbfGAA2D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 20:28:03 -0400
Received: from localhost (localhost [127.0.0.1])
        by disroot.org (Postfix) with ESMTP id 3FC1735BAA;
        Mon,  1 Jul 2019 02:28:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
        by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id UN81psw9be_1; Mon,  1 Jul 2019 02:28:01 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
        t=1561940881; bh=t7j28rombFbL6cwt8pNOaQHa3pyzcppWqxQx8LfuPpM=;
        h=Date:From:Subject:To:Cc;
        b=cFA13tXevxwI2nCB4oG67SVnG6jmp43SVDFp4CUW63pJ18NGfFF4TgSfqGxioEhsO
         FrFThZwAlww3YiXaLiGn6qb9/T6b5KqicfzruVBDnIU+bn10/r218Ih/dVr8PqrCUi
         +zNxe+K3ecwSzOgL+BBWPoe4/6FQLDOLF8FBBN0wctOAEh86skK4MzmH7gTRsZzfWL
         f8r/Qdzu+zwvcbS8QhXz3qmZOldcf4O0AN0W3T4K2qjZk42xxeGDND/UpQjyJILRV3
         JTpHElGyIo70YkvK/RZG8ULuGN4KK1RxyjMoWu3+p6eJpV8U7w/UdQupHKWmJpM72w
         tyNI7rSA3tjOA==
Date:   Mon, 01 Jul 2019 00:28:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From:   colerogers@disroot.org
Message-ID: <deaf38687dd8e9a970bc60bfd838ed62@disroot.org>
Subject: [PATCH] Input: synaptics: enable SMBUS on T480 thinkpad trackpad
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        benjamin.tissoires@redhat.com
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Cole Rogers <colerogers@disroot.org>=0A=0AThinkpad t480 laptops had=
 some touchpad features disabled, resulting in the=0Aloss of pinch to act=
ivities in GNOME, on wayland, and other touch gestures=0Abeing slower. Th=
is patch adds the touchpad of the t480 to the smbus_pnp_ids=0Awhitelist t=
o enable the extra features. In my testing this does not break=0Asuspend =
(on fedora, with wayland, and GNOME, using the rc-6 kernel), while=0Aalso=
 fixing the feature on a T480.=0A=0ASigned-off-by: Cole Rogers <coleroger=
s@disroot.org>=0A=0A---=0A drivers/input/mouse/synaptics.c | 1 +=0A 1 fil=
e changed, 1 insertion(+)=0A=0Adiff --git a/drivers/input/mouse/synaptics=
.c b/drivers/input/mouse/synaptics.c=0Aindex b8ec30102..c8d0f5795 100644=
=0A--- a/drivers/input/mouse/synaptics.c=0A+++ b/drivers/input/mouse/syna=
ptics.c=0A@@ -170,6 +170,7 @@ static const char * const smbus_pnp_ids[] =
=3D {=0A        "LEN005b", /* P50 */=0A        "LEN005e", /* T560 */=0A  =
      "LEN0071", /* T480 */=0A+       "LEN0093", /* T480 */=0A        "LE=
N0072", /* X1 Carbon Gen 5 (2017) - Elan/ALPS trackpoint */=0A        "LE=
N0073", /* X1 Carbon G5 (Elantech) */=0A        "LEN0092", /* X1 Carbon 6=
 */=0A-- =0A2.21.0
