Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C774D307844
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 15:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhA1Oi0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 09:38:26 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:43122 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbhA1OiZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 09:38:25 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SEZGsp123398;
        Thu, 28 Jan 2021 14:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=yAx4Xh6Lrg7c9rpWXyju1T5K/HIYa6UIkgVFDKlyW58=;
 b=r5XchmnPBaW1P1/+97bHB/HOtRNoIwYyMfw5g7c/alCw2aHk2X49GycNG5a8szFVhHvi
 WgJtARGjBZOEpMDTPFNSC5virtPklIEVbGVHZAmjJyp5cPKBJ346T4rwrnuQMSTUpM1n
 O7slYq71/BZGWFANLLSmr+vNXSOojNNjnJ6kcoPRm6LKES3OfJLpGiraQi2yi4wgwQio
 JO83NRt6gIsB6SKCcRLBIbPXA4MCy6+qUyNhIxDzAtfrnh6ECdlpBRtzirHL9KEUf05g
 FZMmmKaZne4Q74P0FRyOam69AJh/Sp168bTxghgNQ65f6k4PZvjl99PpbG8H3KxHrMdG mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 3689aavks0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 14:37:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10SEaEpj114407;
        Thu, 28 Jan 2021 14:37:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 368wr0dgu2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 14:37:34 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10SEbXNK006472;
        Thu, 28 Jan 2021 14:37:33 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 Jan 2021 06:37:32 -0800
Date:   Thu, 28 Jan 2021 17:37:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: elants_i2c - add support for eKTF3624
Message-ID: <20210128143726.GT20820@kadam>
References: <YBKKePZ1VyZIbBCo@mwanda>
 <20210128130705.GA32681@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128130705.GA32681@qmqm.qmqm.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280074
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 28, 2021 at 02:07:05PM +0100, Michał Mirosław wrote:
> On Thu, Jan 28, 2021 at 12:57:12PM +0300, Dan Carpenter wrote:
> > Hello Michał Mirosław,
> > 
> > The patch 9517b95bdc46: "Input: elants_i2c - add support for
> > eKTF3624" from Jan 24, 2021, leads to the following static checker
> > warning:
> > 
> > 	drivers/input/touchscreen/elants_i2c.c:966 elants_i2c_mt_event()
> > 	warn: should this be a bitwise negate mask?
> > 
> > drivers/input/touchscreen/elants_i2c.c
> [...]
> >    963                                  w = buf[FW_POS_WIDTH + i / 2];
> >    964                                  w >>= 4 * (~i & 1);
> >    965                                  w |= w << 4;
> >    966                                  w |= !w;
> >                                         ^^^^^^^^
> > 
> > This code is just very puzzling.  I think it may actually be correct?
> > The boring and conventional way to write this would be to do it like so:
> > 
> > 	if (!w)
> > 		w = 1;
> 
> It could also be written as:
> 
> 	w += !w;
> 
> or:
> 	w += w == 0;
> 
> while avoiding conditional.

Is there some kind of prize for avoiding if statements??

> 
> But, in this case, the warning is bogus. Because w | ~w == all-ones (always),
> it might as well suggested to write:
> 
> 	w = -1;
> 
> or:
> 	w = ~0;
> 
> making the code broken.

Yeah.  The rule is just a simple heuristic of a logical negate used
with a bitwise operation.  You're comment has prompted me to review
if this check is effective.

It turns out that it's not a super common thing so it doesn't lead to
many warnings whether they are false positives or real bugs.  We did
find one bug last week (in linux-next):
5993e79398d3 ("drm/amdgpu: Fix masking binary not operator on two mask operations")

There are only three other warnings for this rule in the kernel:

drivers/pci/pcie/aer_inject.c:376 aer_inject() warn: should this be a bitwise negate mask?
drivers/pci/pcie/aer_inject.c:381 aer_inject() warn: should this be a bitwise negate mask?
drivers/net/wireless/realtek/rtlwifi/rtl8821ae/dm.c:2435 rtl8821ae_dm_refresh_basic_rate_mask() warn: should this be a bitwise negate mask?

I never reported any of these because they're in ancient code and I
couldn't figure out what it was trying to do.

drivers/pci/pcie/aer_inject.c
   374          if (aer_mask_override) {
   375                  cor_mask_orig = cor_mask;
   376                  cor_mask &= !(einj->cor_status);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Is the bitwise ~ intended?  Why is BIT(0) special?  You would have to
know the PCIe hardware spec to say the answer for that.  It's sort of
like BIT(0) is a magic number but invisible...  :/

   377                  pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK,
   378                                         cor_mask);
   379  
   380                  uncor_mask_orig = uncor_mask;
   381                  uncor_mask &= !(einj->uncor_status);
   382                  pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK,
   383                                         uncor_mask);
   384          }

drivers/net/wireless/realtek/rtlwifi/rtl8821ae/dm.c
  2415  static void rtl8821ae_dm_refresh_basic_rate_mask(struct ieee80211_hw *hw)
  2416  {
  2417          struct rtl_priv *rtlpriv = rtl_priv(hw);
  2418          struct dig_t *dm_digtable = &rtlpriv->dm_digtable;
  2419          struct rtl_mac *mac = &rtlpriv->mac80211;
  2420          static u8 stage;
  2421          u8 cur_stage = 0;
  2422          u16 basic_rate = RRSR_1M | RRSR_2M | RRSR_5_5M | RRSR_11M | RRSR_6M;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The important thing to note here is BIT(0) is RRSR_1M.

  2423  
  2424          if (mac->link_state < MAC80211_LINKED)
  2425                  cur_stage = 0;
  2426          else if (dm_digtable->rssi_val_min < 25)
  2427                  cur_stage = 1;
  2428          else if (dm_digtable->rssi_val_min > 30)
  2429                  cur_stage = 3;
  2430          else
  2431                  cur_stage = 2;
  2432  
  2433          if (cur_stage != stage) {
  2434                  if (cur_stage == 1) {
  2435                          basic_rate &= (!(basic_rate ^ mac->basic_rates));
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Here we set "basic_rate" to either 0 or RRSR_1M.

  2436                          rtlpriv->cfg->ops->set_hw_reg(hw,
  2437                                  HW_VAR_BASIC_RATE, (u8 *)&basic_rate);

This can't possibly be correct but the the ->set_hw_reg() implementations
seem to have a work around where they take do:

	basic_rate |= 0x01;

at the start of the function.  Magic numbers again.  *le bigger sigh*.

  2438                  } else if (cur_stage == 3 && (stage == 1 || stage == 2)) {
  2439                          rtlpriv->cfg->ops->set_hw_reg(hw,
  2440                                  HW_VAR_BASIC_RATE, (u8 *)&mac->basic_rates);
  2441                  }
  2442          }
  2443          stage = cur_stage;
  2444  }

regards,
dan carpenter
