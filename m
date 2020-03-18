Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC17189AF0
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 12:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgCRLqH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 07:46:07 -0400
Received: from v6.sk ([167.172.42.174]:51362 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbgCRLqG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 07:46:06 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id EFF5F60EC2;
        Wed, 18 Mar 2020 11:46:04 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Input: add driver for power button on Dell Wyse 3020
Date:   Wed, 18 Mar 2020 12:45:54 +0100
Message-Id: <20200318114556.2064-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

please take a look at this pair of patches and consider applying them.
It's essentially a rather simple driver for a power button on Dell Ariel
board as used in 3020 series thin client, accessed via EC's SPI bus.

Thanks
Lubo


