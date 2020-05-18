Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE83F1D7E3B
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 18:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgERQVI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 12:21:08 -0400
Received: from mail-bn7nam10on2058.outbound.protection.outlook.com ([40.107.92.58]:6172
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727005AbgERQVH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 12:21:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYOLnb0tSgR9irS4nSUlkhVIbbwyF0cJYHCcGtx9KeetOjZBNkpN395SAwZK5wFbYZ1daLXY/pnWdEUqFnNh1YhQuOk4/8yOy10GZZ0UUFxyDpVTpJ2Fgb3/u3IkimmmpE2gT3q3DxEJXMrn5ihNYA/SB0rfqxadEisuBsGHUTHDxaRgh5ua9jUIC+o9RObRR7qIA0GLKc5lxyrQMDrmAP5uUp3QhEUy4UiCMQ1XQgZfksPTVFC2U/T+VkUjYuY9i2yQbp4rU0bFRuuoy08Wx+tgWdR0zNUycI9FoArnmuAOD3NGZD7xamJTu4BLNcvRsEoZuIMfpmj0JyTzQQqeAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuO0YeB4gxzHC5cIqIN4bpgTLO8YPo/QS25Q2Aa7olw=;
 b=du/cox4AVbLgvGcA+60e7qOPnqktnMxEh2Ar7h3I7KhNeJug4Dz1JF0gd1MBca3abJVEjw4TtH/Otc7N7mEIf0AzvglEeZdx4otUNYan/0oKLcrTigIW/GguUY0crULZYa5eQERwBkNJ4ejiJ2HPFmYLVUDSPXxDOkfwfVQg7eISjDWdJ3Ghn64ThTGHvy4IUoHSc3pOzRhQ53urGjUhF6kCELIk1EFGgxLnjXgZWWZ/Np+toVnQ8Cuj1t6c9KBOM/UQcsTxjTm0adxSaXvp341nHEFIuWzUFUHCOydLqiNMM9Z6NzlgHE4dUAJ6uE2w6FDyGkMb391w/u0w12SHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuO0YeB4gxzHC5cIqIN4bpgTLO8YPo/QS25Q2Aa7olw=;
 b=yexbSpzs/G25enY+wPM4BxLaKRnKd9ZSoH+7Kec/eWykYrQ4dGSOzfbSXERuF2kNRql0JaTEq6fza6JDcLjYqsSQbtljcE1pHnYhHOQVZaOdcT4snkOqiOkXrp0ENf2f1iXENH1wzsp4thxzqDN2qvynM7Ie/Z/m20I/WpNPABI=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5277.namprd08.prod.outlook.com (2603:10b6:805:9e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 16:21:03 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823%7]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 16:21:03 +0000
Date:   Mon, 18 May 2020 11:20:58 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: Tree for May 18 (input/misc/iqs269a.c & regmap)
Message-ID: <20200518162058.GA18713@labundy.com>
References: <20200518205725.72eb3148@canb.auug.org.au>
 <60dadc36-daec-2c48-a317-843ce52ae4f5@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60dadc36-daec-2c48-a317-843ce52ae4f5@infradead.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SN4PR0401CA0003.namprd04.prod.outlook.com
 (2603:10b6:803:21::13) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by SN4PR0401CA0003.namprd04.prod.outlook.com (2603:10b6:803:21::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Mon, 18 May 2020 16:21:03 +0000
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29477bfa-c5cc-4bb4-e487-08d7fb4775d0
X-MS-TrafficTypeDiagnostic: SN6PR08MB5277:
X-Microsoft-Antispam-PRVS: <SN6PR08MB5277D927496D92B425C04E80D3B80@SN6PR08MB5277.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zbybf0HG6OPuc5mRqcv1226pRKTv5/PyT8FQDXn4s+M29wqvWHMFJnfPgF9MOc/uclDDUIg1cKATQyrlZxgnm9dQTMZgB9efRhT4dzBryE60Wsk+jhmZI83l25gzDYBqfs1qakES2t/6DIsw42Xl25ccEMFEIt2r71OFjaLLDtVJHZnF8Y8jTUIYWGGgRs7TgJPn+x+vWhEYO376SgAA7jF9FUWA/zMhY1N7xce6Ff6aV6B1ODDBHLMJ2q5dJrx7Q6I3Pt/tRVxO9R7zZ8lAO6xl2DxEskWBUwvNFlIQBtyAnrxBQ9LOcZQl3OukrXY8+XZ/Lje/Dgbo/o7TA1GEg1w63F4Fjkx7v6Q7Q/aXAkkEfIoscCNRBB/SeSz36qeXkIXwPdkTAa/KNNvT4hT2aR1utO8HZspE7pTdgB6HJZ4+JvsBPe0CWMhTz4f5rLsa2rFR+TaucKs/g958Fqb3yI5JiZM/BHrjDrpByEbbumIYxgxdK5mA6akDbSIEy3MiujNfiOM5ya3RemtFmhCWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(376002)(39830400003)(136003)(346002)(55016002)(6916009)(6666004)(26005)(66946007)(86362001)(66476007)(66556008)(2906002)(2616005)(5660300002)(956004)(53546011)(36756003)(54906003)(1076003)(4326008)(16526019)(508600001)(186003)(966005)(52116002)(33656002)(8936002)(8676002)(316002)(8886007)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: hG9KKBIbj6ucNIqwLFV8Lw6Z76tI9/3ctlYNKtmNRM5i47BgTQ3LZtrKm5tY1ZVpbS//HPo8KoVsSCJ1LiAdg3K4K+pmgpzQpbVt73oNE8U4C56t2pLyR81/wwtMRew67gkIqE/FeZgS8UVHTT4V22NHQRsQtR30ObxLLfL9IrZomc8dK3wVAb0QlLidznjeAyRE7i9S6reVbZixXzaMrggTZSyNqL8Xf/dCfpfpcmdNoVBlzfiUWECWNPGkvyCItV7b6by7AZ5YsYRX+RpovJlXa0MP/bAHhbiCUM4VTSSXXtXRbb5okmyGZPDK3mv3QpbzfRyNfIRy2ZiJWh0HxptFMr7Gu0m41AxBNGCOUkAWsyb7oWlrv2kK0UXZrPLF9yK1YM5n9brkS9VEIzM6t2KIS2l4aXzZH3tXLzCra5v5urDMWQqYk/qz3lX6mkbOq+HFE3VIX5kGc/jG0tU3MrtorfefFx2QA36urrEspYo=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29477bfa-c5cc-4bb4-e487-08d7fb4775d0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 16:21:03.6757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSfBzq18N7f1AwjED+cvTjH0sXbA5X98/+3FEaiW+ftRmkkVnzZVPHCa8WKhINLgjEtAcnp/68D4tR63niYUoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5277
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Randy et al,

On Mon, May 18, 2020 at 08:42:43AM -0700, Randy Dunlap wrote:
> On 5/18/20 3:57 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200515:
> > 
> 
> on i386:
> 
> 
> CONFIG_REGMAP_I2C=y
> CONFIG_I2C=m
> 
> WARNING: unmet direct dependencies detected for REGMAP_I2C
>   Depends on [m]: I2C [=m]
>   Selected by [y]:
>   - INPUT_IQS269A [=y] && !UML && INPUT [=y] && INPUT_MISC [=y]
> 
> 
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_read':
> regmap-i2c.c:(.text+0x192): undefined reference to `i2c_smbus_read_byte_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_write':
> regmap-i2c.c:(.text+0x1d7): undefined reference to `i2c_smbus_write_byte_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_read':
> regmap-i2c.c:(.text+0x202): undefined reference to `i2c_smbus_read_word_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_read_swapped':
> regmap-i2c.c:(.text+0x242): undefined reference to `i2c_smbus_read_word_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_write_swapped':
> regmap-i2c.c:(.text+0x2a1): undefined reference to `i2c_smbus_write_word_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_write':
> regmap-i2c.c:(.text+0x2d7): undefined reference to `i2c_smbus_write_word_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read_reg16':
> regmap-i2c.c:(.text+0x310): undefined reference to `i2c_smbus_write_byte_data'
> ld: regmap-i2c.c:(.text+0x323): undefined reference to `i2c_smbus_read_byte'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write_reg16':
> regmap-i2c.c:(.text+0x39c): undefined reference to `i2c_smbus_write_i2c_block_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write':
> regmap-i2c.c:(.text+0x3db): undefined reference to `i2c_smbus_write_i2c_block_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read':
> regmap-i2c.c:(.text+0x427): undefined reference to `i2c_smbus_read_i2c_block_data'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_read':
> regmap-i2c.c:(.text+0x49f): undefined reference to `i2c_transfer'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_gather_write':
> regmap-i2c.c:(.text+0x524): undefined reference to `i2c_transfer'
> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_write':
> regmap-i2c.c:(.text+0x56c): undefined reference to `i2c_transfer_buffer_flags'
> ld: drivers/input/misc/iqs269a.o: in function `iqs269_i2c_driver_init':
> iqs269a.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> ld: drivers/input/misc/iqs269a.o: in function `iqs269_i2c_driver_exit':
> iqs269a.c:(.exit.text+0x9): undefined reference to `i2c_del_driver'
> 
> 
> 
> Full randconfig file is attached.

A complete oversight on my part; during my testing I did not realize
another module was selecting I2C for me. Valuable lesson learned :)

The kbuild test robot set off the alarm bells earlier today and I've
sent a patch [1] already. Many apologies for all of the noise.

> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

[1] https://patchwork.kernel.org/patch/11555469/

Kind regards,
Jeff LaBundy
