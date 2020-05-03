Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05B851C2F14
	for <lists+linux-input@lfdr.de>; Sun,  3 May 2020 22:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgECUMo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 May 2020 16:12:44 -0400
Received: from v6.sk ([167.172.42.174]:35958 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgECUMo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 3 May 2020 16:12:44 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 54D90610C9;
        Sun,  3 May 2020 20:12:42 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add driver for power button on Dell Wyse 3020
Date:   Sun,  3 May 2020 22:12:35 +0200
Message-Id: <20200503201237.413864-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

please consider applying the patches chained to this message. It's a
rather simple driver for a power button on Dell Ariel board along with
the Device Tree binding document.

Thank you
Lubo


